package=crate_hex_literal_impl
$(package)_crate_name=hex-literal-impl
$(package)_version=0.2.1
$(package)_download_path=https://static.crates.io/crates/$($(package)_crate_name)
$(package)_file_name=$($(package)_crate_name)-$($(package)_version).crate
$(package)_sha256_hash=9d4c5c844e2fee0bf673d54c2c177f1713b3d2af2ff6e666b49cb7572e6cf42d
$(package)_crate_versioned_name=$($(package)_crate_name)

define $(package)_preprocess_cmds
  $(call generate_crate_checksum,$(package))
endef

define $(package)_stage_cmds
  $(call vendor_crate_source,$(package))
endef
