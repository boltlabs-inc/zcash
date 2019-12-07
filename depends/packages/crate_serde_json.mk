package=crate_serde_json
$(package)_crate_name=serde_json
$(package)_version=1.0.44
$(package)_download_path=https://static.crates.io/crates/$($(package)_crate_name)
$(package)_file_name=$($(package)_crate_name)-$($(package)_version).crate
$(package)_sha256_hash=48c575e0cc52bdd09b47f330f646cf59afc586e9c4e3ccd6fc1f625b8ea1dad7
$(package)_crate_versioned_name=$($(package)_crate_name)

define $(package)_preprocess_cmds
  $(call generate_crate_checksum,$(package))
endef

define $(package)_stage_cmds
  $(call vendor_crate_source,$(package))
endef
