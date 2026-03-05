#!/bin/bash
# Copyright (C) 2000 ZeroDream
# https://github.com/zero-dream

# --------------------------------------------------

cd "$WRT_MainPath/"

# CheckExit
[[ "$CI_Owner" != "$ZD_Owner" ]] && exit 0

# --------------------------------------------------

# Source
source "$CI_RepositoryPath/zerowrt-firmware/private/script/common/updatePackage.sh"

# addPackage 'tailscale'

updatePackage

# --------------------------------------------------

exit 0
