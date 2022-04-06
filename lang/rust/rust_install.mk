define Host/Prepare
	[ -d $(RUST_TMP_DIR) ] || \
	  mkdir -p $(RUST_TMP_DIR)
endef

define Host/Configure
	true
endef

define Host/Compile
	true
endef
