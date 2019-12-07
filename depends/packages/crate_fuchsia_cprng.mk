package=crate_fuchsia_cprng
$(package)_crate_name=fuchsia-cprng
$(package)_version=0.1.1
$(package)_download_path=https://static.crates.io/crates/$($(package)_crate_name)
$(package)_file_name=$($(package)_crate_name)-$($(package)_version).crate
$(package)_sha256_hash=a06f77d526c1a601b7c4cdd98f54b5eaabffc14d5f2f0296febdc7f357c6d3ba
$(package)_crate_versioned_name=$($(package)_crate_name)

define $(package)_preprocess_cmds
  $(call generate_crate_checksum,$(package))
endef

define $(package)_stage_cmds
  $(call vendor_crate_source,$(package))
endef
