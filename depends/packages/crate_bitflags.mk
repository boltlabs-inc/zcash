package=crate_bitflags
$(package)_crate_name=bitflags
$(package)_version=1.2.1
$(package)_download_path=https://static.crates.io/crates/$($(package)_crate_name)
$(package)_file_name=$($(package)_crate_name)-$($(package)_version).crate
$(package)_sha256_hash=cf1de2fe8c75bc145a2f577add951f8134889b4795d47466a54a5c846d691693
$(package)_crate_versioned_name=$($(package)_crate_name)

define $(package)_preprocess_cmds
  $(call generate_crate_checksum,$(package))
endef

define $(package)_stage_cmds
  $(call vendor_crate_source,$(package))
endef
