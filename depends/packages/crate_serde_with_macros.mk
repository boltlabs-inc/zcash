package=crate_serde_with_macros
$(package)_crate_name=serde_with_macros
$(package)_version=1.0.1
$(package)_download_path=https://static.crates.io/crates/$($(package)_crate_name)
$(package)_file_name=$($(package)_crate_name)-$($(package)_version).crate
$(package)_sha256_hash=f6304d92ad5493e340b95c353b8328c312d020f0eb5cb6df8506f160f5b7300d
$(package)_crate_versioned_name=$($(package)_crate_name)

define $(package)_preprocess_cmds
  $(call generate_crate_checksum,$(package))
endef

define $(package)_stage_cmds
  $(call vendor_crate_source,$(package))
endef
