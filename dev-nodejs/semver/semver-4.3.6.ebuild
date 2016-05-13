# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="${PN}.min.js ${PN}.min.js.gz ${PN}.browser.js ${PN}.browser.js.gz"

inherit node-module

DEPEND="dev-util/uglifyjs"

DESCRIPTION="The semantic version parser used by npm"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md )

src_compile() {
	emake clean
	emake
}
