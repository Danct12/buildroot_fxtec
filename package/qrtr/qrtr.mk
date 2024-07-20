################################################################################
#
# qrtr
#
################################################################################

QRTR_VERSION = v1.1
QRTR_SITE = https://github.com/linux-msm/qrtr.git
QRTR_SITE_METHOD = git
QRTR_LICENSE = BSD-3-Clause
QRTR_DEPENDENCIES = host-pkgconf

QRTR_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_QRTR_NS),y)
QRTR_CONF_OPTS += -Dqrtr-ns=enabled
ifeq ($(BR2_PACKAGE_SYSTEMD),y)
QRTR_CONF_OPTS += -Dsystemd-service=enabled
endif
else
QRTR_CONF_OPTS += -Dqrtr-ns=disabled
endif

$(eval $(meson-package))
