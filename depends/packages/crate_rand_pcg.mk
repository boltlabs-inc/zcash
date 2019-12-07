package=crate_rand_pcg
$(package)_crate_name=rand_pcg
$(package)_version=0.1.2
$(package)_download_path=https://static.crates.io/crates/$($(package)_crate_name)
$(package)_file_name=$($(package)_crate_name)-$($(package)_version).crate
$(package)_sha256_hash=abf9b09b01790cfe0364f52bf32995ea3c39f4d2dd011eac241d2914146d0b44
$(package)_crate_versioned_name=$($(package)_crate_name)

define $(package)_preprocess_cmds
  $(call generate_crate_checksum,$(package))
endef

define $(package)_stage_cmds
  $(call vendor_crate_source,$(package))
endef
