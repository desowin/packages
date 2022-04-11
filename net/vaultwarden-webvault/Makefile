#
# Copyright (C) 2022 Tomasz Moń <desowin@gmail.com>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=vaultwarden-webvault
PKG_VERSION:=2022.12.0
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=bw_web_v$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/dani-garcia/bw_web_builds/releases/download/v$(PKG_VERSION)
PKG_HASH:=402dff6aa205d8d7493c79b051bbc947adb0b14181ae0b07242caa049ff480c7

include $(INCLUDE_DIR)/package.mk

PKG_UNPACK:=$(HOST_TAR) -C "$(PKG_BUILD_DIR)" -xzf "$(DL_DIR)/$(PKG_SOURCE)"

define Package/vaultwarden-webvault
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=@!SMALL_FLASH @!LOW_MEMORY_FOOTPRINT +vaultwarden
  TITLE:=Vaultwarden web vault
  URL:=https://github.com/dani-garcia/bw_web_builds
endef

define Package/vaultwarden-webvault/description
Bitwarden web vault with the patches to make it work with vaultwarden
endef

define Build/Compile
endef

define Package/vaultwarden-webvault/install
	$(INSTALL_DIR) $(1)/opt/vaultwarden/web-vault
	$(CP) $(PKG_BUILD_DIR)/web-vault/* $(1)/opt/vaultwarden/web-vault
endef

$(eval $(call BuildPackage,vaultwarden-webvault))
