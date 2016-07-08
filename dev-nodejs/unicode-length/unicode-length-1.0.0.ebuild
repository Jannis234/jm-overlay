# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="build"

inherit node-module

DESCRIPTION="Get the length of unicode strings"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-lang/coffee-script"

DOCS=( README.md )

src_compile() {
	coffee -c -o build lib/unicode-length.coffee || die
	rm -r lib || die # Installed by default, but not needed here
}
