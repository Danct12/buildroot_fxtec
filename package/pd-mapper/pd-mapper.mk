################################################################################
#
# pd-mapper
#
################################################################################

PD_MAPPER_VERSION = v1.0
PD_MAPPER_SITE = https://github.com/linux-msm/pd-mapper.git
PD_MAPPER_SITE_METHOD = git
PD_MAPPER_LICENSE = BSD-3-Clause

PD_MAPPER_DEPENDENCIES = qrtr

PD_MAPPER_BUILD_TARGETS = pd-mapper

ifeq ($(BR2_PACKAGE_SYSTEMD),y)
PD_MAPPER_BUILD_TARGETS += pd-mapper.service
endif

define PD_MAPPER_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
		LDFLAGS="-lqrtr" -C $(@D) \
		$(PD_MAPPER_BUILD_TARGETS)
endef

define PD_MAPPER_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 755 $(@D)/pd-mapper $(TARGET_DIR)/usr/bin/pd-mapper
	[ -f "$(@D)/pd-mapper.service" ] && $(INSTALL) -D -m 644 $(@D)/pd-mapper.service \
		$(TARGET_DIR)/usr/lib/systemd/system/pd-mapper.service || :
endef

define PD_MAPPER_INSTALL_INIT_SYSV
	$(INSTALL) -m 755 -D $(BR2_EXTERNAL_FXTEC_BR_PATH)/package/pd-mapper/S99pdmapper \
		$(TARGET_DIR)/etc/init.d/S99pdmapper
endef

$(eval $(generic-package))
