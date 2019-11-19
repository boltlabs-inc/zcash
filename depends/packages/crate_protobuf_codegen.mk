package=crate_protobuf_codegen
$(package)_crate_name=protobuf-codegen
$(package)_version=2.8.1
$(package)_download_path=https://static.crates.io/crates/$($(package)_crate_name)
$(package)_file_name=$($(package)_crate_name)-$($(package)_version).crate
$(package)_sha256_hash=12c6abd78435445fc86898ebbd0521a68438063d4a73e23527b7134e6bf58b4a
$(package)_crate_versioned_name=$($(package)_crate_name)

define $(package)_preprocess_cmds
  $(call generate_crate_checksum,$(package))
endef

define $(package)_stage_cmds
  $(call vendor_crate_source,$(package))
endef
