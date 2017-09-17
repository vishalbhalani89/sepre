################################################################################
#
# lohit
#
################################################################################

LOHIT_VERSION = 2.4.2
LOHIT_SITE = https://releases.pagure.org/lohit
LOHIT_LICENSE_FILES = LICENSE
LOHIT_SOURCE = lohit-fonts-$(LOHIT_VERSION).tar.gz

LOHIT_FONTS_INSTALL =
LOHIT_FONTCONFIG_CONF_INSTALL =

ifeq ($(BR2_PACKAGE_LOHIT_ASSAMESE),y)
LOHIT_FONTS_INSTALL += assamese/lohit_as.ttf
LOHIT_FONTCONFIG_CONF_INSTALL += \
	assamese/66-lohit-assamese.conf
endif

ifeq ($(BR2_PACKAGE_LOHIT_BENGALI),y)
LOHIT_FONTS_INSTALL += bengali/lohit_bn.ttf
LOHIT_FONTCONFIG_CONF_INSTALL += \
	bengali/66-lohit-bengali.conf
endif

ifeq ($(BR2_PACKAGE_LOHIT_GUJARATI),y)
LOHIT_FONTS_INSTALL += gujarati/lohit_gu.ttf
LOHIT_FONTCONFIG_CONF_INSTALL += \
	gujarati/66-lohit-gujarati.conf
endif

ifeq ($(BR2_PACKAGE_LOHIT_HINDI),y)
LOHIT_FONTS_INSTALL += hindi/lohit_hi.ttf
LOHIT_FONTCONFIG_CONF_INSTALL += \
	hindi/66-lohit-hindi.conf
endif

ifeq ($(BR2_PACKAGE_LOHIT_KANNADA),y)
LOHIT_FONTS_INSTALL += kannada/lohit_kn.ttf
LOHIT_FONTCONFIG_CONF_INSTALL += \
	kannada/66-lohit-kannada.conf
endif

ifeq ($(BR2_PACKAGE_LOHIT_KASHMIRI),y)
LOHIT_FONTS_INSTALL += kashmiri/lohit_ks.ttf
LOHIT_FONTCONFIG_CONF_INSTALL += \
	kashmiri/66-lohit-kashmiri@devanagari.conf
endif

ifeq ($(BR2_PACKAGE_LOHIT_KONKANI),y)
LOHIT_FONTS_INSTALL += konkani/lohit_kok.ttf
LOHIT_FONTCONFIG_CONF_INSTALL += \
	konkani/66-lohit-konkani.conf
endif

ifeq ($(BR2_PACKAGE_LOHIT_MAITHILI),y)
LOHIT_FONTS_INSTALL += maithili/lohit_mai.ttf
LOHIT_FONTCONFIG_CONF_INSTALL += \
	maithili/66-lohit-maithili.conf
endif

ifeq ($(BR2_PACKAGE_LOHIT_MALAYALAM),y)
LOHIT_FONTS_INSTALL += malayalam/lohit_ml.ttf
LOHIT_FONTCONFIG_CONF_INSTALL += \
	malayalam/66-lohit-malayalam.conf
endif

ifeq ($(BR2_PACKAGE_LOHIT_MARATHI),y)
LOHIT_FONTS_INSTALL += marathi/lohit_mr.ttf
LOHIT_FONTCONFIG_CONF_INSTALL += \
	marathi/66-lohit-marathi.conf
endif

ifeq ($(BR2_PACKAGE_LOHIT_NEPALI),y)
LOHIT_FONTS_INSTALL += nepali/lohit_ne.ttf
LOHIT_FONTCONFIG_CONF_INSTALL += \
	nepali/66-lohit-nepali.conf
endif

ifeq ($(BR2_PACKAGE_LOHIT_ORIYA),y)
LOHIT_FONTS_INSTALL += oriya/lohit_or.ttf
LOHIT_FONTCONFIG_CONF_INSTALL += \
	oriya/66-lohit-oriya.conf
endif

ifeq ($(BR2_PACKAGE_LOHIT_PUNJABI),y)
LOHIT_FONTS_INSTALL += punjabi/lohit_pa.ttf
LOHIT_FONTCONFIG_CONF_INSTALL += \
	punjabi/66-lohit-punjabi.conf
endif

ifeq ($(BR2_PACKAGE_LOHIT_SINDHI),y)
LOHIT_FONTS_INSTALL += sindhi/lohit_sd.ttf
LOHIT_FONTCONFIG_CONF_INSTALL += \
	sindhi/66-lohit-sindhi@devanagari.conf
endif

ifeq ($(BR2_PACKAGE_LOHIT_TAMIL),y)
LOHIT_FONTS_INSTALL += tamil/lohit_ta.ttf
LOHIT_FONTCONFIG_CONF_INSTALL += \
	tamil/66-lohit-tamil.conf
endif

ifeq ($(BR2_PACKAGE_LOHIT_TELUGU),y)
LOHIT_FONTS_INSTALL += telugu/lohit_te.ttf
LOHIT_FONTCONFIG_CONF_INSTALL += \
	telugu/66-lohit-telugu.conf
endif

ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
define LOHIT_FONTCONFIG_CONF_INSTALL_CMDS
	for i in $(LOHIT_FONTCONFIG_CONF_INSTALL) ; do \
		$(INSTALL) -D -m 0644 $(@D)/$$i \
			$(TARGET_DIR)/usr/share/fontconfig/conf.avail/$$i || exit 1 ; \
	done
endef
endif

define LOHIT_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/fonts/
	for i in $(LOHIT_FONTS_INSTALL) ; do \
		$(INSTALL) -m 0644 $(@D)/$$i \
			$(TARGET_DIR)/usr/lib/fonts/ || exit 1 ; \
	done
	$(LOHIT_FONTCONFIG_CONF_INSTALL_CMDS)
endef

$(eval $(generic-package))
