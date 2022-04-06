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

# Packages the Distribution Artifacts into HOST and TARGET bundles.
define RustHost/PackageDist
	cd $(HOST_BUILD_DIR)/build/dist && \
	  $(TAR) -cJf $(DL_DIR)/$(RUST_INSTALL_TARGET_FILENAME) \
	  rust-*-$(RUSTC_TARGET_ARCH).tar.xz

	cd $(HOST_BUILD_DIR)/build/dist && \
	  $(TAR) -cJf $(DL_DIR)/$(RUST_INSTALL_HOST_FILENAME) \
	  --exclude rust-*-$(RUSTC_TARGET_ARCH).tar.xz *.xz
endef
