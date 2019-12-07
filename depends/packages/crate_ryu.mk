package=crate_ryu
$(package)_crate_name=ryu
$(package)_version=1.0.2
$(package)_download_path=https://static.crates.io/crates/$($(package)_crate_name)
$(package)_file_name=$($(package)_crate_name)-$($(package)_version).crate
$(package)_sha256_hash=bfa8506c1de11c9c4e4c38863ccbe02a305c8188e85a05a784c9e11e1c3910c8
$(package)_crate_versioned_name=$($(package)_crate_name)

define $(package)_preprocess_cmds
  $(call generate_crate_checksum,$(package))
endef

define $(package)_stage_cmds
  $(call vendor_crate_source,$(package))
endef
