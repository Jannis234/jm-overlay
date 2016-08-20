# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.10.0"
NODE_MODULE_EXTRA_FILES="globals.json"

inherit node-module

DESCRIPTION="Global identifiers from different JavaScript environments"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.md )
