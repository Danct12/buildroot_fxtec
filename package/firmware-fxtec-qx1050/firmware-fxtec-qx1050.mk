################################################################################
#
# firmware-fxtec-qx1050
#
################################################################################

FIRMWARE_FXTEC_QX1050_VERSION = 6c1ef5bce85750688f789bc6e232ca8237b24713
FIRMWARE_FXTEC_QX1050_SITE = https://github.com/sm6115-mainline/firmware-fxtec-qx1050.git
FIRMWARE_FXTEC_QX1050_SITE_METHOD = git
FIRMWARE_FXTEC_QX1050_LICENSE = Proprietary

FIRMWARE_FXTEC_QX1050_FILES =

ifeq ($(BR2_PACKAGE_FIRMWARE_FXTEC_QX1050_ADRENO),y)
FIRMWARE_FXTEC_QX1050_FILES += qcom/sm6115/Fxtec/QX1050/a610_zap.mbn
endif

ifeq ($(BR2_PACKAGE_FIRMWARE_FXTEC_QX1050_ADSP),y)
FIRMWARE_FXTEC_QX1050_FILES += qcom/sm6115/Fxtec/QX1050/adsp.mbn \
			       qcom/sm6115/Fxtec/QX1050/adspr.jsn \
			       qcom/sm6115/Fxtec/QX1050/adsps.jsn \
			       qcom/sm6115/Fxtec/QX1050/adspua.jsn
endif

ifeq ($(BR2_PACKAGE_FIRMWARE_FXTEC_QX1050_CDSP),y)
FIRMWARE_FXTEC_QX1050_FILES += qcom/sm6115/Fxtec/QX1050/cdsp.mbn \
			       qcom/sm6115/Fxtec/QX1050/cdspr.jsn
endif

ifeq ($(BR2_PACKAGE_FIRMWARE_FXTEC_QX1050_MODEM),y)
FIRMWARE_FXTEC_QX1050_FILES += qcom/sm6115/Fxtec/QX1050/modem.mbn \
			       qcom/sm6115/Fxtec/QX1050/modemr.jsn \
			       qcom/sm6115/Fxtec/QX1050/modemuw.jsn
endif

ifeq ($(BR2_PACKAGE_FIRMWARE_FXTEC_QX1050_WLAN),y)
FIRMWARE_FXTEC_QX1050_FILES += qcom/sm6115/Fxtec/QX1050/wlanmdsp.mbn
endif

ifeq ($(call qstrip,$(FIRMWARE_FXTEC_QX1050_FILES)),)
$(error No firmware type specified. Check your BR2_PACKAGE_FIRMWARE_FXTEC_QX1050 setting)
endif

define FIRMWARE_FXTEC_QX1050_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/lib/firmware/qcom/sm6115/Fxtec/QX1050

	for i in $(FIRMWARE_FXTEC_QX1050_FILES) ; do \
		$(INSTALL) -D -m 644 $(@D)/lib/firmware/$$i \
			$(TARGET_DIR)/lib/firmware/$$i ; \
	done
endef

$(eval $(generic-package))
