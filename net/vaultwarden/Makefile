include $(TOPDIR)/rules.mk

PKG_NAME := vaultwarden
PKG_VERSION := 1.22.2
PKG_RELEASE := 1

PKG_SOURCE_PROTO := git
PKG_SOURCE_DATE := 2021-07-25
PKG_SOURCE_VERSION := c6664971300a360a82b42db1bcf0a7d883717fff
PKG_SOURCE_URL := https://github.com/dani-garcia/vaultwarden.git

PKG_BUILD_DEPENDS := rust/host

include ../../lang/rust/rust_environment.mk
include $(INCLUDE_DIR)/package.mk

define Build/Compile
	$(call RustPackage/Cargo/Compile, --features sqlite)
endef

define Package/vaultwarden
    SECTION:=net
    CATEGORY:=Network
    DEPENDS:=@!SMALL_FLASH @!LOW_MEMORY_FOOTPRINT
    TITLE:=Alternative implementation of the Bitwarden server API
    URL:=https://github.com/dani-garcia/vaultwarden
endef

define Package/vaultwarden/description
Alternative implementation of the Bitwarden server API written in Rust and compatible with upstream Bitwarden clients
endef

define Package/vaultwarden/install
	$(INSTALL_DIR) $(1)/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/target/$(REAL_GNU_TARGET_NAME)/release/vaultwarden $(1)/bin/vaultwarden
endef

$(eval $(call BuildPackage,vaultwarden))
