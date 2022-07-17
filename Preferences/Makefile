SYSROOT = $(THEOS)/sdks/iPhoneOS14.4.sdk/
ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:12.0

FINALPACKAGE = 1
DEBUG = 0
THEOS_LEAN_AND_MEAN = 1

BUNDLE_NAME = PaiBloxxPrefs
$(BUNDLE_NAME)_FILES = $(wildcard *.m)
$(BUNDLE_NAME)_INSTALL_PATH = /Library/PreferenceBundles
$(BUNDLE_NAME)_CFLAGS = -fobjc-arc
$(BUNDLE_NAME)_FRAMEWORKS = Preferences
$(BUNDLE_NAME)_EXTRA_FRAMEWORKS = Cephei CepheiPrefs

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/bundle.mk
include $(THEOS_MAKE_PATH)/aggregate.mk