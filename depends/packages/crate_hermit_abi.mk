package=crate_hermit_abi
$(package)_crate_name=hermit-abi
$(package)_version=0.1.3
$(package)_download_path=https://static.crates.io/crates/$($(package)_crate_name)
$(package)_file_name=$($(package)_crate_name)-$($(package)_version).crate
$(package)_sha256_hash=307c3c9f937f38e3534b1d6447ecf090cafcc9744e4a6360e8b037b2cf5af120
$(package)_crate_versioned_name=$($(package)_crate_name)

define $(package)_preprocess_cmds
  $(call generate_crate_checksum,$(package))
endef

define $(package)_stage_cmds
  $(call vendor_crate_source,$(package))
endef
