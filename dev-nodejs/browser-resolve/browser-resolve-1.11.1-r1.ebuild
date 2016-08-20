# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="empty.js"
NODE_MODULE_DEPEND="resolve:1.1.7"

inherit node-module

DESCRIPTION="Resolve which handles browser field support in package.json"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
