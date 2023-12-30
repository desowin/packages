#
# Copyright (C) 2022 Tomasz Moń <desowin@gmail.com>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=vaultwarden
PKG_VERSION:=1.32.5
PKG_RELEASE:=1
PKG_LICENSE:=AGPL-3.0-only
PKG_LICENSE_FILES:=LICENSE.txt

PKG_SOURCE_PROTO := git
PKG_SOURCE_DATE := 2024-11-18
PKG_SOURCE_VERSION := cdfdc6ff4f61a7495cd70609c0d9098ff10b55a4
PKG_MIRROR_HASH := 85f4d223dcca0f390d2f5dcfa3f879122e855f1888751511fdc672bb9aefbfd8
PKG_SOURCE_URL := https://github.com/dani-garcia/vaultwarden.git

PKG_BUILD_DEPENDS:=rust/host
PKG_FIXUP:=autoreconf

RUST_PKG_FEATURES:=sqlite

include $(INCLUDE_DIR)/package.mk
include ../../lang/rust/rust-package.mk

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

$(eval $(call RustBinPackage,vaultwarden))
$(eval $(call BuildPackage,vaultwarden))
