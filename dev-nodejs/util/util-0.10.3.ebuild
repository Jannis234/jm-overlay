# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="support"
NODE_MODULE_DEPEND="inherits:2.0.1"

inherit node-module

DESCRIPTION="Node.JS util module"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
