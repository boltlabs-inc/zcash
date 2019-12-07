package=crate_time
$(package)_crate_name=time
$(package)_version=0.1.42
$(package)_download_path=https://static.crates.io/crates/$($(package)_crate_name)
$(package)_file_name=$($(package)_crate_name)-$($(package)_version).crate
$(package)_sha256_hash=db8dcfca086c1143c9270ac42a2bbd8a7ee477b78ac8e45b19abfb0cbede4b6f
$(package)_crate_versioned_name=$($(package)_crate_name)

define $(package)_preprocess_cmds
  $(call generate_crate_checksum,$(package))
endef

define $(package)_stage_cmds
  $(call vendor_crate_source,$(package))
endef
