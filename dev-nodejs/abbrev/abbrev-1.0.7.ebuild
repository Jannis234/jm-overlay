# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_HAS_TEST="1"

inherit node-module

DESCRIPTION="Like ruby's abbrev module, but in js"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DEPEND="${DEPEND}
	test? ( dev-util/tap )"

DOCS=( README.md CONTRIBUTING.md )

src_test() {
	node-module_src_test
	tap test.js || die "Tests failed"
}
