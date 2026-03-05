#!/bin/bash
# Copyright (C) 2000 ZeroDream
# https://github.com/zero-dream

# --------------------------------------------------

cd "$WRT_MainPath/"

# CheckExit
[[ "$CI_Owner" != "$ZD_Owner" ]] && exit 0

# --------------------------------------------------

# 添加 Package 配置
cat "$CI_ConfigPath/PackageConfig" >>"$WRT_ConfigPath"

# --------------------------------------------------

exit 0
