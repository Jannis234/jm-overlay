# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="${PN}.min.js"

inherit node-module

DESCRIPTION="A markdown parser built for speed"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-util/uglifyjs"

DOCS=( README.md doc/broken.md doc/todo.md )
