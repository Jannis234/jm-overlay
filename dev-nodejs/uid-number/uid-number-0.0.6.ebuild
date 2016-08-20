# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="get-uid-gid.js uid-number.js"

inherit node-module

DESCRIPTION="Convert a username/group name to a uid/gid number"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
