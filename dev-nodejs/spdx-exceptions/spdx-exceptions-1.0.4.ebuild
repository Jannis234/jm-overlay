# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="index.json"

inherit node-module

DESCRIPTION="List of SPDX standard license exceptions"

LICENSE="CC-BY-3.0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md )
