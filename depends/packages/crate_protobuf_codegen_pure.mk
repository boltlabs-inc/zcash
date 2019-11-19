package=crate_protobuf_codegen_pure
$(package)_crate_name=protobuf-codegen-pure
$(package)_version=2.8.1
$(package)_download_path=https://static.crates.io/crates/$($(package)_crate_name)
$(package)_file_name=$($(package)_crate_name)-$($(package)_version).crate
$(package)_sha256_hash=c1646acda5319f5b28b0bff4a484324df43ddae2c0f5a3f3e63c0b26095cd600
$(package)_crate_versioned_name=$($(package)_crate_name)

define $(package)_preprocess_cmds
  $(call generate_crate_checksum,$(package))
endef

define $(package)_stage_cmds
  $(call vendor_crate_source,$(package))
endef
