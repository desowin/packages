# Rust Environmental Vars
RUST_VERSION:=rust-1.59.0
CONFIG_HOST_SUFFIX:=$(shell cut -d"-" -f4 <<<"$(GNU_HOST_NAME)")
RUSTC_HOST_ARCH:=$(HOST_ARCH)-unknown-linux-$(CONFIG_HOST_SUFFIX)
RUSTC_TARGET_ARCH:=$(REAL_GNU_TARGET_NAME)
CARGO_HOME:=$(STAGING_DIR_HOST)
RUSTC_TARGET_AVAILABLE:=$($(CARGO_HOME)/bin/rustc --print target-list | awk '$1 ~ /$(RUSTC_TARGET_ARCH)/')

# Rust-lang has an uninstall script
RUST_UNINSTALL:=$(CARGO_HOME)/lib/rustlib/uninstall.sh

# These RUSTFLAGS are common across all TARGETs
RUSTFLAGS = "-C linker=$(TOOLCHAIN_DIR)/bin/$(TARGET_CC_NOCACHE) -C ar=$(TOOLCHAIN_DIR)/bin/$(TARGET_AR)"

# Common Build Flags
RUST_BUILD_FLAGS = \
  RUSTFLAGS=$(RUSTFLAGS) \
  CARGO_HOME="$(CARGO_HOME)"

# This adds the rust environmental variables to Make calls
MAKE_FLAGS += $(RUST_BUILD_FLAGS)

# ARM Logic
ifeq ($(ARCH),arm)
  ifeq ($(CONFIG_arm_v7),y)
    RUSTC_TARGET_ARCH:=$(subst arm,armv7,$(RUSTC_TARGET_ARCH))
  endif
endif

ifeq ($(ARCH),arm)
  ifeq ($(CONFIG_HAS_FPU),y)
    RUSTC_TARGET_ARCH:=$(subst muslgnueabi,muslgnueabihf,$(RUSTC_TARGET_ARCH))
  endif
endif

RUST_INSTALL_HOST_FILENAME:=$(RUST_VERSION)-$(RUSTC_HOST_ARCH)-install.tar.xz
RUST_INSTALL_TARGET_FILENAME:=$(RUST_VERSION)-$(RUSTC_TARGET_ARCH)-install.tar.xz

# Is RUSTC_TARGET_ARCH installed and available?
RUSTC_TARGET_AVAILABLE:=$($(CARGO_HOME)/bin/rustc --print target-list | awk '$1 ~ /$(RUSTC_TARGET_ARCH)/')

# Updates Cargo.lock for Packages
define RustPackage/Cargo/Update
	cd $(PKG_BUILD_DIR) && \
	CARGO_HOME=$(CARGO_HOME) RUSTFLAGS=$(RUSTFLAGS) cargo update $(1)
endef

# Build Cargo-based Packages
define RustPackage/Cargo/Compile
	cd $(PKG_BUILD_DIR) && \
	  CARGO_HOME=$(CARGO_HOME) RUSTFLAGS=$(RUSTFLAGS) cargo build -v --release \
	  --target $(RUSTC_TARGET_ARCH) $(1)
endef

# Is RUSTC_TARGET_ARCH installed and available?
RUSTC_TARGET_AVAILABLE:=$($(CARGO_HOME)/bin/rustc --print target-list | awk '$1 ~ /$(RUSTC_TARGET_ARCH)/')

# See if the target toolchain is installed/available
# Attempt to install if not
ifeq ($(RUSTC_TARGET_AVAILABLE),)
ifeq ($(HAS_TARGET_INSTALL),true)
$(eval $(call HostBuild,rust))
endif
endif
