################################################################################
#
# tqftpserv
#
################################################################################

TQFTPSERV_VERSION = v1.1
TQFTPSERV_SITE = https://github.com/linux-msm/tqftpserv.git
TQFTPSERV_SITE_METHOD = git
TQFTPSERV_LICENSE = BSD-3-Clause

TQFTPSERV_DEPENDENCIES = host-pkgconf qrtr zstd

define TQFTPSERV_INSTALL_INIT_SYSV
	$(INSTALL) -m 755 -D $(BR2_EXTERNAL_FXTEC_BR_PATH)/package/tqftpserv/S99tqftpserv \
		$(TARGET_DIR)/etc/init.d/S99tqftpserv
endef

$(eval $(meson-package))
