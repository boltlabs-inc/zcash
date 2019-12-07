package=crate_serde_derive
$(package)_crate_name=serde_derive
$(package)_version=1.0.103
$(package)_download_path=https://static.crates.io/crates/$($(package)_crate_name)
$(package)_file_name=$($(package)_crate_name)-$($(package)_version).crate
$(package)_sha256_hash=a8c6faef9a2e64b0064f48570289b4bf8823b7581f1d6157c1b52152306651d0
$(package)_crate_versioned_name=$($(package)_crate_name)

define $(package)_preprocess_cmds
  $(call generate_crate_checksum,$(package))
endef

define $(package)_stage_cmds
  $(call vendor_crate_source,$(package))
endef
