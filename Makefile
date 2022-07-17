export SYSROOT = $(THEOS)/sdks/iPhoneOS14.4.sdk/
export ARCHS = arm64 arm64e
export TARGET = iphone:clang:latest:12.0

export FINALPACKAGE = 1
export DEBUG = 0
export THEOS_LEAN_AND_MEAN = 1

INSTALL_TARGET_PROCESSES = SpringBoard

SUBPROJECTS += ControlCentre Preferences

include $(THEOS)/makefiles/common.mk
include $(THEOS)/makefiles/aggregate.mk
include $(THEOS_MAKE_PATH)/tweak.mk