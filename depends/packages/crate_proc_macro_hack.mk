package=crate_proc_macro_hack
$(package)_crate_name=proc-macro-hack
$(package)_version=0.5.11
$(package)_download_path=https://static.crates.io/crates/$($(package)_crate_name)
$(package)_file_name=$($(package)_crate_name)-$($(package)_version).crate
$(package)_sha256_hash=ecd45702f76d6d3c75a80564378ae228a85f0b59d2f3ed43c91b4a69eb2ebfc5
$(package)_crate_versioned_name=$($(package)_crate_name)

define $(package)_preprocess_cmds
  $(call generate_crate_checksum,$(package))
endef

define $(package)_stage_cmds
  $(call vendor_crate_source,$(package))
endef
