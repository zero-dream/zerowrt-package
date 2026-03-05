#!/bin/bash
# Copyright (C) 2000 ZeroDream
# https://github.com/zero-dream

# --------------------------------------------------

cd "$WRT_MainPath/"

# CheckExit
[[ "$CI_Owner" != "$ZD_Owner" ]] && exit 0

# --------------------------------------------------

# Source
source "$ZD_LibPath/createPath.sh"
source "$ZD_LibPath/private/getApp.sh"

# --------------------------------------------------

# PackPrivateData

# CreatePath
tempPath="$CI_TempPath/PackPrivateData" && mkdir -p "$tempPath"

# WrtConfig
cp -a "$WRT_ConfigPath" "$tempPath/$WRT_NAME-WrtConfig-$WRT_CONFIG-$ZD_Date"

# CollectZeroWrtBin
[[ "$WRT_ONLY_CONFIG" == 'false' ]] && tar -czvf "$tempPath/$WRT_NAME-ZeroWrtBin-$WRT_CONFIG-$ZD_Date.tar.gz" \
  --exclude='*.bin' \
  --exclude='*.ubi' \
  -C "$WRT_MainPath" \
  'bin'

# ... Add other files

# ZipEncrypt
appPath=$(getApp 'zerowrt-zerowrt-linux-amd64') || exit 1
"$appPath" zipcrypto encrypt \
  --dataPath "$tempPath/" \
  --outputPath "$ZD_ArtifactUploadPath/$WRT_NAME-PrivateData-$WRT_CONFIG-$ZD_Date"
[[ $? -ne 0 ]] && exit 1

# DeletePath
rm -rf "$tempPath"

# --------------------------------------------------

exit 0
