package=crate_redox_syscall
$(package)_crate_name=redox_syscall
$(package)_version=0.1.56
$(package)_download_path=https://static.crates.io/crates/$($(package)_crate_name)
$(package)_file_name=$($(package)_crate_name)-$($(package)_version).crate
$(package)_sha256_hash=2439c63f3f6139d1b57529d16bc3b8bb855230c8efcc5d3a896c8bea7c3b1e84
$(package)_crate_versioned_name=$($(package)_crate_name)

define $(package)_preprocess_cmds
  $(call generate_crate_checksum,$(package))
endef

define $(package)_stage_cmds
  $(call vendor_crate_source,$(package))
endef
