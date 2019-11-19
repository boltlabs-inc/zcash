package=librustzcash
$(package)_version=0.2.0
# $(package)_download_path=https://github.com/zcash/$(package)/archive/
$(package)_download_path=https://github.com/boltlabs-inc/$(package)/archive/
$(package)_file_name=$(package)-$($(package)_git_commit).tar.gz
$(package)_download_file=$($(package)_git_commit).tar.gz
$(package)_sha256_hash=bef66e1f3a0c98df4a5de7405a477dc893e8d555939683c91e926cc3234427f6
$(package)_git_commit=b8cd0eb1e55e5cecf595f2aabe6a213be899c4e8
$(package)_dependencies=rust
ifeq ($(LIBRUSTZCASH_OVERRIDE),)
$(package)_dependencies+=$(rust_crates)
$(package)_patches=cargo.config remove-dev-dependencies.diff
endif

$(package)_rust_target=$(if $(rust_rust_target_$(canonical_host)),$(rust_rust_target_$(canonical_host)),$(canonical_host))

ifeq ($(host_os),mingw32)
$(package)_library_file=target/x86_64-pc-windows-gnu/release/rustzcash.lib
else ifneq ($(canonical_host),$(build))
$(package)_library_file=target/$($(package)_rust_target)/release/librustzcash.a
else
$(package)_library_file=target/release/librustzcash.a
endif

define $(package)_set_vars
$(package)_build_opts=--release
ifeq ($(LIBRUSTZCASH_OVERRIDE),)
$(package)_build_opts+=--frozen
endif
ifneq ($(canonical_host),$(build))
$(package)_build_opts+=--target=$($(package)_rust_target)
endif
endef

ifneq ($(LIBRUSTZCASH_OVERRIDE),)

define $(package)_fetch_cmds
endef

define $(package)_extract_cmds
endef

define $(package)_build_cmds
  cd $(LIBRUSTZCASH_OVERRIDE) && \
  $(host_prefix)/native/bin/cargo build --package librustzcash $($(package)_build_opts)
endef

define $(package)_stage_cmds
  mkdir $($(package)_staging_dir)$(host_prefix)/lib/ && \
  mkdir $($(package)_staging_dir)$(host_prefix)/include/ && \
  cp $(LIBRUSTZCASH_OVERRIDE)/$($(package)_library_file) $($(package)_staging_dir)$(host_prefix)/lib/ && \
  cp $(LIBRUSTZCASH_OVERRIDE)/librustzcash/include/librustzcash.h $($(package)_staging_dir)$(host_prefix)/include/
endef

else

define $(package)_preprocess_cmds
  patch -p1 < $($(package)_patch_dir)/remove-dev-dependencies.diff && \
  mkdir .cargo && \
  cat $($(package)_patch_dir)/cargo.config | sed 's|CRATE_REGISTRY|$(host_prefix)/$(CRATE_REGISTRY)|' > .cargo/config
endef

define $(package)_build_cmds
  $(host_prefix)/native/bin/cargo build --package librustzcash $($(package)_build_opts)
endef

define $(package)_stage_cmds
  mkdir $($(package)_staging_dir)$(host_prefix)/lib/ && \
  mkdir $($(package)_staging_dir)$(host_prefix)/include/ && \
  cp $($(package)_library_file) $($(package)_staging_dir)$(host_prefix)/lib/ && \
  cp librustzcash/include/librustzcash.h $($(package)_staging_dir)$(host_prefix)/include/
endef

endif
