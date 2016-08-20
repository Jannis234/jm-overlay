# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="index.js~"

inherit node-module

DESCRIPTION="Convert umask from string <-> number"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md ChangeLog )
