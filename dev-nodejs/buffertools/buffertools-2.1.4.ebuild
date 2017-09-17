# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="0.3.0"
NODE_MODULE_HAS_TEST="1"
NODE_MODULE_EXTRA_FILES="build"

inherit node-module toolchain-funcs

DESCRIPTION="Working with node.js buffers made easy"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DEPEND="${DEPEND}
	>=net-libs/nodejs-${NODEJS_MIN_VERSION}"
DOCS=( AUTHORS README.md )

src_compile() {
	# Use a pre-generated Makefile instead of pulling in node-gyp (huge!)
	# This also makes it easier to respect settings like the user's CXXFLAGS
	cp "${FILESDIR}/Makefile" ./ || die
	tc-export CXX
	emake
}

node_module_run_test() {
	node test.js || die "Tests failed"
}
