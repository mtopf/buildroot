################################################################################
#
# openlayers
#
################################################################################

OPENLAYERS_VERSION = 6.0.1
OPENLAYERS_SOURCE = v$(OPENLAYERS_VERSION)-dist.zip
OPENLAYERS_SITE = https://github.com/openlayers/openlayers/releases/download/v$(OPENLAYERS_VERSION)
OPENLAYERS_LICENSE = BSD-2-Clause
# There's no separate license file in the archive, only minified files.

define OPENLAYERS_EXTRACT_CMDS
	unzip $(OPENLAYERS_DL_DIR)/$(OPENLAYERS_SOURCE) -d $(@D)
	mv $(@D)/v$(OPENLAYERS_VERSION)-dist/* $(@D)
	rmdir $(@D)/v$(OPENLAYERS_VERSION)-dist/
endef

define OPENLAYERS_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0644 -D -t $(TARGET_DIR)/var/www/ \
		$(@D)/ol.css $(@D)/ol.js
endef

$(eval $(generic-package))
