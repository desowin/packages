#
# Copyright (C) 2022 Tomasz Moń <desowin@gmail.com>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=vaultwarden
PKG_VERSION:=1.35.1
PKG_RELEASE:=1
PKG_LICENSE:=AGPL-3.0-only
PKG_LICENSE_FILES:=LICENSE.txt

PKG_SOURCE_PROTO := git
PKG_SOURCE_DATE := 2025-12-30
PKG_SOURCE_VERSION := 3e2cef7e8b27cf33cb735d428553f835bc5dd6c2
PKG_MIRROR_HASH := e518a4d46ecf4a9836ff9a18bd335ac34fe2acc4a84f1cc6cacc2343cf7e81fe
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
