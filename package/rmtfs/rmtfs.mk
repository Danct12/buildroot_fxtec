################################################################################
#
# rmtfs
#
################################################################################

RMTFS_VERSION = 33e1e40615efc59b17a515afe857c51b8b8c1ad1
RMTFS_SITE = https://github.com/linux-msm/rmtfs.git
RMTFS_SITE_METHOD = git
RMTFS_LICENSE = BSD-3-Clause

RMTFS_DEPENDENCIES = qrtr

RMTFS_BUILD_TARGETS = rmtfs

ifeq ($(BR2_PACKAGE_SYSTEMD),y)
RMTFS_BUILD_TARGETS += rmtfs.service
endif

define RMTFS_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
		LDFLAGS="-lqrtr -ludev -lpthread" -C $(@D) \
		$(RMTFS_BUILD_TARGETS)
endef

define RMTFS_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 755 $(@D)/rmtfs $(TARGET_DIR)/usr/bin/rmtfs
	[ -f "$(@D)/rmtfs.service" ] && $(INSTALL) -D -m 644 $(@D)/rmtfs.service \
		$(TARGET_DIR)/usr/lib/systemd/system/rmtfs.service || :
endef

define RMTFS_INSTALL_INIT_SYSV
	$(INSTALL) -m 755 -D $(BR2_EXTERNAL_FXTEC_BR_PATH)/package/rmtfs/S99rmtfs \
		$(TARGET_DIR)/etc/init.d/S99rmtfs
endef

$(eval $(generic-package))
