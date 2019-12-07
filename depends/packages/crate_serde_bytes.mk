package=crate_serde_bytes
$(package)_crate_name=serde_bytes
$(package)_version=0.11.3
$(package)_download_path=https://static.crates.io/crates/$($(package)_crate_name)
$(package)_file_name=$($(package)_crate_name)-$($(package)_version).crate
$(package)_sha256_hash=325a073952621257820e7a3469f55ba4726d8b28657e7e36653d1c36dc2c84ae
$(package)_crate_versioned_name=$($(package)_crate_name)

define $(package)_preprocess_cmds
  $(call generate_crate_checksum,$(package))
endef

define $(package)_stage_cmds
  $(call vendor_crate_source,$(package))
endef
