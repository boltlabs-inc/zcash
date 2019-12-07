package=crate_itoa
$(package)_crate_name=itoa
$(package)_version=0.4.4
$(package)_download_path=https://static.crates.io/crates/$($(package)_crate_name)
$(package)_file_name=$($(package)_crate_name)-$($(package)_version).crate
$(package)_sha256_hash=501266b7edd0174f8530248f87f99c88fbe60ca4ef3dd486835b8d8d53136f7f
$(package)_crate_versioned_name=$($(package)_crate_name)

define $(package)_preprocess_cmds
  $(call generate_crate_checksum,$(package))
endef

define $(package)_stage_cmds
  $(call vendor_crate_source,$(package))
endef
