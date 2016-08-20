# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.8"
NODE_MODULE_DEPEND="escape-html:1.0.3
	unpipe:1.0.0
	on-finished:2.3.0
	debug:2.2.0"

inherit node-module

DESCRIPTION="Node.js final http responder"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md HISTORY.md )
