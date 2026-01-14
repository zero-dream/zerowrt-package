#!/bin/bash
# Copyright (C) 2000 ZeroDream
# https://github.com/zero-dream

# --------------------------------------------------

cd "$WRT_MainPath/"

[[ -z "$ZeroDream_Secret" ]] && exit 2

# --------------------------------------------------

# 添加 Package 配置
cat "$CI_ConfigPath/PackageConfig" >>"$WRT_ConfigPath"
