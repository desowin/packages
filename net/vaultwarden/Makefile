#
# Copyright (C) 2022 Tomasz Moń <desowin@gmail.com>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=vaultwarden
PKG_VERSION:=1.25.2
PKG_RELEASE:=1
PKG_LICENSE:=GPL-3.0-only
PKG_LICENSE_FILES:=LICENSE.txt

PKG_SOURCE_PROTO := git
PKG_SOURCE_DATE := 2022-07-25
PKG_SOURCE_VERSION := ce9d93003cd37a79edba1ba830a6c6d3fa22c2c8
PKG_MIRROR_HASH := 0e095662f9da4a76b5623b6e1ee678e651bde5ae8afebffc3c9496f1d54e535a
PKG_SOURCE_URL := https://github.com/dani-garcia/vaultwarden.git

PKG_BUILD_DEPENDS:=rust/host
PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/package/feeds/packages/rust/rustc_environment.mk

CARGO_BUILD_FLAGS += \
	TARGET_CC=$(TOOLCHAIN_DIR)/bin/$(TARGET_CC_NOCACHE) \
	TARGET_AR=$(TOOLCHAIN_DIR)/bin/$(TARGET_AR) \
	RUST_BACKTRACE=full

define Build/Compile
	$(call RustPackage/Cargo/Compile, --features sqlite)
endef

define Package/vaultwarden
    SECTION:=net
    CATEGORY:=Network
    DEPENDS:=@!SMALL_FLASH @!LOW_MEMORY_FOOTPRINT @!BIG_ENDIAN +libopenssl
    TITLE:=Alternative implementation of the Bitwarden server API
    URL:=https://github.com/dani-garcia/vaultwarden
endef

define Package/vaultwarden/description
Alternative implementation of the Bitwarden server API written in Rust and compatible with upstream Bitwarden clients
endef

define Package/vaultwarden/install
	$(INSTALL_DIR) $(1)/opt/vaultwarden
	$(INSTALL_DIR) $(1)/opt/vaultwarden/data
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/target/$(RUSTC_TARGET_ARCH)/release/vaultwarden $(1)/opt/vaultwarden/vaultwarden
endef

$(eval $(call BuildPackage,vaultwarden))
