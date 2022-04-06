define Host/Prepare
	# Ensure rust temp directory
	[ -d $(RUST_TMP_DIR) ] || \
	  mkdir -p $(RUST_TMP_DIR)

	$(call Host/Prepare/Default)
endef

# Makes and then packages the dist artifacts
define Host/Compile
	cd $(HOST_BUILD_DIR) && \
	  $(PYTHON) x.py --config ./config.toml dist build-manifest cargo llvm-tools \
	    rustc rust-std rust-src

	$(call RustHost/PackageDist)
endef
