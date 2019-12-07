package=crate_rand_jitter
$(package)_crate_name=rand_jitter
$(package)_version=0.1.4
$(package)_download_path=https://static.crates.io/crates/$($(package)_crate_name)
$(package)_file_name=$($(package)_crate_name)-$($(package)_version).crate
$(package)_sha256_hash=1166d5c91dc97b88d1decc3285bb0a99ed84b05cfd0bc2341bdf2d43fc41e39b
$(package)_crate_versioned_name=$($(package)_crate_name)

define $(package)_preprocess_cmds
  $(call generate_crate_checksum,$(package))
endef

define $(package)_stage_cmds
  $(call vendor_crate_source,$(package))
endef
