package=libbolt
$(package)_version=0.3.0
$(package)_download_path=https://github.com/boltlabs-inc/$(package)/archive/
$(package)_file_name=$(package)-$($(package)_git_commit).tar.gz
$(package)_download_file=$($(package)_git_commit).tar.gz
$(package)_sha256_hash=b277e844b6ec106c4eb10e4d3265386ac2c2d51434c996e58ea352cc9b83c350
$(package)_git_commit=bd050d7da6feaa32347be84996b4d7b8eca71136
$(package)_dependencies=rust
ifeq ($(LIBBOLT_OVERRIDE),)
$(package)_dependencies+=$(rust_crates)
endif

$(package)_rust_target=$(if $(rust_rust_target_$(canonical_host)),$(rust_rust_target_$(canonical_host)),$(canonical_host))

ifeq ($(host_os),mingw32)
$(package)_library_file=target/x86_64-pc-windows-gnu/release/bolt.lib
else ifneq ($(canonical_host),$(build))
$(package)_library_file=target/$($(package)_rust_target)/release/libbolt.a
else
$(package)_library_file=target/release/libbolt.a
endif

define $(package)_set_vars
$(package)_build_opts=--release
ifneq ($(canonical_host),$(build))
$(package)_build_opts+=--target=$($(package)_rust_target)
endif
endef

ifneq ($(LIBBOLT_OVERRIDE),)

define $(package)_fetch_cmds
endef

define $(package)_extract_cmds
endef

define $(package)_build_cmds
  cd $(LIBBOLT_OVERRIDE) && \
  $(host_prefix)/native/bin/cargo build --package bolt $($(package)_build_opts)
endef

define $(package)_stage_cmds
  mkdir $($(package)_staging_dir)$(host_prefix)/lib/ && \
  mkdir $($(package)_staging_dir)$(host_prefix)/include/ && \
  cp $(LIBBOLT_OVERRIDE)/$($(package)_library_file) $($(package)_staging_dir)$(host_prefix)/lib/ && \
  cp $(LIBBOLT_OVERRIDE)/include/libbolt.h $($(package)_staging_dir)$(host_prefix)/include/
endef

else

define $(package)_build_cmds
  $(host_prefix)/native/bin/cargo build --package bolt $($(package)_build_opts)
endef

define $(package)_stage_cmds
  mkdir $($(package)_staging_dir)$(host_prefix)/lib/ && \
  mkdir $($(package)_staging_dir)$(host_prefix)/include/ && \
  cp $($(package)_library_file) $($(package)_staging_dir)$(host_prefix)/lib/ && \
  cp include/libbolt.h $($(package)_staging_dir)$(host_prefix)/include/
endef

endif
