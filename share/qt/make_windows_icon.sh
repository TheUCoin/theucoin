#!/bin/bash
# create multiresolution windows icon
#mainnet
ICON_SRC=../../src/qt/res/icons/tucoin.png
ICON_DST=../../src/qt/res/icons/tucoin.ico
convert ${ICON_SRC} -resize 16x16 tucoin-16.png
convert ${ICON_SRC} -resize 32x32 tucoin-32.png
convert ${ICON_SRC} -resize 48x48 tucoin-48.png
convert tucoin-16.png tucoin-32.png tucoin-48.png ${ICON_DST}
#testnet
ICON_SRC=../../src/qt/res/icons/tucoin_testnet.png
ICON_DST=../../src/qt/res/icons/tucoin_testnet.ico
convert ${ICON_SRC} -resize 16x16 tucoin-16.png
convert ${ICON_SRC} -resize 32x32 tucoin-32.png
convert ${ICON_SRC} -resize 48x48 tucoin-48.png
convert tucoin-16.png tucoin-32.png tucoin-48.png ${ICON_DST}
rm tucoin-16.png tucoin-32.png tucoin-48.png
