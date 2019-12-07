package=crate_rand_os
$(package)_crate_name=rand_os
$(package)_version=0.1.3
$(package)_download_path=https://static.crates.io/crates/$($(package)_crate_name)
$(package)_file_name=$($(package)_crate_name)-$($(package)_version).crate
$(package)_sha256_hash=7b75f676a1e053fc562eafbb47838d67c84801e38fc1ba459e8f180deabd5071
$(package)_crate_versioned_name=$($(package)_crate_name)

define $(package)_preprocess_cmds
  $(call generate_crate_checksum,$(package))
endef

define $(package)_stage_cmds
  $(call vendor_crate_source,$(package))
endef
