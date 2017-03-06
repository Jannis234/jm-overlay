# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.6"
NODE_MODULE_DEPEND="source-map:0.3.0"
NODE_MODULE_HAS_TEST="1"

inherit node-module

DESCRIPTION="Adds source mappings and base64 encodes them"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="examples test"

DOCS=( README.md )
DEPEND="${DEPEND}
	dev-util/tap:0.7"

src_install() {
	node-module_src_install
	use examples && dodoc -r example
}

node_module_run_test() {
	install_node_module_build_depend "tap:0.7"
	tap-0.7 test/*.js || die "Tests failed"
}
