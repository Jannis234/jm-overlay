# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="jsonparse:1.2.0
	through:2.3.8"

inherit node-module

DESCRIPTION="rawStream.pipe(JSONStream.parse()).pipe(streamOfObjects)"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DOCS=( readme.markdown )

src_install() {
	node-module_src_install
	use examples && dodoc -r examples
}
