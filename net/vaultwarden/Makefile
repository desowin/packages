#
# Copyright (C) 2022 Tomasz Moń <desowin@gmail.com>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=vaultwarden
PKG_VERSION:=1.27.0
PKG_RELEASE:=1
PKG_LICENSE:=GPL-3.0-only
PKG_LICENSE_FILES:=LICENSE.txt

PKG_SOURCE_PROTO := git
PKG_SOURCE_DATE := 2022-12-18
PKG_SOURCE_VERSION := 10dadfca068ed449fcd4a74b70ae2cd83990d3d4
PKG_MIRROR_HASH := 3106cdec1f6cac23fdf385d2c84932485595690c662d36d1f5693bb8d5505f3a
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
