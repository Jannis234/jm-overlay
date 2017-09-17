# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_EXTRA_FILES="stringify.js"

inherit node-module

DESCRIPTION="Like JSON.stringify, but doesn't blow up on circular refs"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md CHANGELOG.md )

src_compile() { :; }
