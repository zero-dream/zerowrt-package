#!/bin/bash
# Copyright (C) 2000 ZeroDream
# https://github.com/zero-dream

# --------------------------------------------------

# Source
source "$ZD_ScriptLibPath/createPath.sh"

# --------------------------------------------------

cd "$WRT_MainPath/"

[[ -z "$ZeroDream_Secret" ]] && exit 2

# --------------------------------------------------

# ParseZeroWrtPackage
outputPath="$CI_TempPath/ParseZeroWrtPackage" && mkdir -p "$outputPath"
"$CI_AppPath/ParseZeroWrtPackage-linux-amd64" \
  --dataPath "$WRT_MainPath/bin" \
  --configPath "$CI_ConfigPath/PackageConfig" \
  --outputPath "$outputPath"
(($? != 0)) && exit 2

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
