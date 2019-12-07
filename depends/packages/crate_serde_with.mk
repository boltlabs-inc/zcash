package=crate_serde_with
$(package)_crate_name=serde_with
$(package)_version=1.3.1
$(package)_download_path=https://static.crates.io/crates/$($(package)_crate_name)
$(package)_file_name=$($(package)_crate_name)-$($(package)_version).crate
$(package)_sha256_hash=32dc67e726b4b06ccf46860bef46fe713fffde11181d6c3c2f3104a670ceddb1
$(package)_crate_versioned_name=$($(package)_crate_name)

define $(package)_preprocess_cmds
  $(call generate_crate_checksum,$(package))
endef

define $(package)_stage_cmds
  $(call vendor_crate_source,$(package))
endef
