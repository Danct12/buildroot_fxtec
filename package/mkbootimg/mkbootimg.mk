################################################################################
#
# mkbootimg
#
################################################################################

MKBOOTIMG_VERSION = 2022.11.09
MKBOOTIMG_SITE = https://github.com/osm0sis/mkbootimg.git
MKBOOTIMG_SITE_METHOD = git
MKBOOTIMG_LICENSE = BSD-3-Clause
MKBOOTIMG_LICENSE_FILES = NOTICE

define MKBOOTIMG_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
endef

define MKBOOTIMG_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/mkbootimg $(TARGET_DIR)/usr/bin/mkbootimg
	$(INSTALL) -m 0755 $(@D)/unpackbootimg $(TARGET_DIR)/usr/bin/unpackbootimg
endef

define HOST_MKBOOTIMG_BUILD_CMDS
	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D)
endef

define HOST_MKBOOTIMG_INSTALL_CMDS
	$(INSTALL) -m 0755 $(@D)/mkbootimg $(HOST_DIR)/bin/mkbootimg
	$(INSTALL) -m 0755 $(@D)/unpackbootimg $(HOST_DIR)/bin/unpackbootimg
endef

$(eval $(generic-package))
$(eval $(host-generic-package))
