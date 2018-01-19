#!/bin/bash

## Dostosuj wersje plików!!!

GEOGEBRA="GeoGebra-Linux64-Portable-6-0-417-0.zip"
GEOGEBRA_ICON="geogebra.svg"
GEOGEBRA_DESKTOP="geogebra.desktop"

STELLARIUM="Stellarium-0.17.0.1-x86_64.AppImage"
STELLARIUM_DESKTOP="stellarium.desktop"
STELLARIUM_ICON="stellarium.png"

if [ -e $GEOGEBRA ]; then
  unzip -o $GEOGEBRA -d /opt
  if [ -e $GEOGEBRA_ICON ]; then
    cp -f $GEOGEBRA_ICON /usr/share/icons/hicolor/scalable/apps
  fi
  if [ -e $GEOGEBRA_DESKTOP ]; then
    cp -f $GEOGEBRA_DESKTOP /usr/share/applications
  fi
fi

if [ -e $STELLARIUM ]; then
  [ ! -d "/opt/stellarium" ] && mkdir "/opt/stellarium"
  cp -f $STELLARIUM /opt/stellarium
  chmod a+x /opt/stellarium/$STELLARIUM
  if [ -e $STELLARIUM_ICON ]; then
    cp -f $STELLARIUM_ICON /opt/stellarium
  fi
  if [ -e $STELLARIUM_DESKTOP ]; then
    cp -f $STELLARIUM_DESKTOP /usr/share/applications
  fi
fi

exit 0
