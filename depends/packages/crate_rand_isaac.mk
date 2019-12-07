package=crate_rand_isaac
$(package)_crate_name=rand_isaac
$(package)_version=0.1.1
$(package)_download_path=https://static.crates.io/crates/$($(package)_crate_name)
$(package)_file_name=$($(package)_crate_name)-$($(package)_version).crate
$(package)_sha256_hash=ded997c9d5f13925be2a6fd7e66bf1872597f759fd9dd93513dd7e92e5a5ee08
$(package)_crate_versioned_name=$($(package)_crate_name)

define $(package)_preprocess_cmds
  $(call generate_crate_checksum,$(package))
endef

define $(package)_stage_cmds
  $(call vendor_crate_source,$(package))
endef
