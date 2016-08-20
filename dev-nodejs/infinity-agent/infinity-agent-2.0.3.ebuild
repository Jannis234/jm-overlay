# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="http.js https.js"

inherit node-module

DESCRIPTION="Creates HTTP/HTTPS Agent with Infinity maxSockets"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.md )
