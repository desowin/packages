#
# Copyright (C) 2022 Tomasz Moń <desowin@gmail.com>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=vaultwarden
PKG_VERSION:=1.37.0
PKG_RELEASE:=1
PKG_LICENSE:=AGPL-3.0-only
PKG_LICENSE_FILES:=LICENSE.txt

PKG_SOURCE_PROTO := git
PKG_SOURCE_DATE := 2026-07-24
PKG_SOURCE_VERSION := 46ae59eaf444f0ae0a799070cf2bd6c415284a51
PKG_MIRROR_HASH := 1186a407f2b746264f39825af26151eb3b5f38a7c8161c233efef14146787e0d
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
