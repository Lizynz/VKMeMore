export ARCHS = arm64 arm64e
DEBUG = 0
export TARGET = iphone:clang:14.2
GO_EASY_ON_ME = 1

PACKAGE_VERSION = 1.0.2

export SYSROOT = $(THEOS)/sdks/iPhoneOS14.2.sdk

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = VKMeMore

VKMeMore_FILES = Tweak.xm
VKMeMore_CFLAGS = -fobjc-arc
VKMeMore_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
