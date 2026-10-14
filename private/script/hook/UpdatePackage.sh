#!/bin/bash
# Copyright (C) 2026 ZeroDream
# https://github.com/zero-dream

# --------------------------------------------------

cd "$WRT_MainPath/"

# CheckExit
[[ "$CI_Owner" != "$ZD_Owner" ]] && exit 0

# --------------------------------------------------

# Source
source "$ZD_RepositoryPath/ZeroWrtFirmware/private/script/common/updatePackage.sh"

# --------------------------------------------------

# addPackage 'tailscale'

# --------------------------------------------------

addAllPackage

updatePackage

# --------------------------------------------------

exit 0
