package=crate_secp256k1
$(package)_crate_name=secp256k1
$(package)_version=0.16.0
$(package)_download_path=https://static.crates.io/crates/$($(package)_crate_name)
$(package)_file_name=$($(package)_crate_name)-$($(package)_version).crate
$(package)_sha256_hash=c09827284b9998d39f0c176b8c9e7f8ffd7de47bc37f0a5238eb228a9aa20d4d
$(package)_crate_versioned_name=$($(package)_crate_name)

define $(package)_preprocess_cmds
  $(call generate_crate_checksum,$(package))
endef

define $(package)_stage_cmds
  $(call vendor_crate_source,$(package))
endef
