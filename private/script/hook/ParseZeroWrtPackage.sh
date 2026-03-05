#!/bin/bash
# Copyright (C) 2000 ZeroDream
# https://github.com/zero-dream

# --------------------------------------------------

cd "$WRT_MainPath/"

# CheckExit
[[ "$CI_Owner" != "$ZD_Owner" ]] && exit 0
[[ "$WRT_ONLY_CONFIG" == 'true' ]] && exit 0

# --------------------------------------------------

# Source
source "$ZD_LibPath/createPath.sh"
source "$ZD_LibPath/private/getApp.sh"

# --------------------------------------------------

# ParseZeroWrtPackage

# OutputPath
outputPath="$CI_TempPath/ParseZeroWrtPackage" && mkdir -p "$outputPath"

# ParsePkg
appPath=$(getApp 'zerowrt-package-linux-amd64') || exit 1
"$appPath" parsepkg \
  --dataPath "$WRT_MainPath/bin" \
  --configPath "$CI_ConfigPath/PackageConfig" \
  --outputPath "$outputPath"
[[ $? -ne 0 ]] && exit 1

# CompressPackage
compressPath="$CI_TempPath/CompressPackage" && mkdir -p "$compressPath"
[[ -d "$outputPath" ]] || exit 2 # 若路径不存在则终止 Jobs
cd "$outputPath"
for packageName in *; do
  [[ -e "$packageName" ]] || continue # 跳过空的匹配
  cp -a "$CI_StoragePath/package-readme" "$outputPath/$packageName/README.txt"
  archiveName="$compressPath/$packageName.tar.gz"
  tar -czvf "$archiveName" -C "$outputPath" "$packageName"
done

# --------------------------------------------------

exit 0
