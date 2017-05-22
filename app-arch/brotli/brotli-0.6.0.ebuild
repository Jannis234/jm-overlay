# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{3,4,5} pypy )
DISTUTILS_OPTIONAL="1"

inherit toolchain-funcs distutils-r1

DESCRIPTION="Generic-purpose lossless compression algorithm"
HOMEPAGE="https://github.com/google/brotli"
SRC_URI="https://github.com/google/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT python? ( Apache-2.0 )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="python doc test"

RDEPEND="python? ( ${PYTHON_DEPS} )"
DEPEND="${RDEPEND}"
REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

DOCS=( README.md CONTRIBUTING.md )

src_prepare() {
	sed -i "s/-O2/\$(CUSTOM_CFLAGS)/g" Makefile || die
	eapply_user
}

src_configure() {
	use python && distutils-r1_src_configure
}

src_compile() {
	tc-export CC
	emake bro lib CUSTOM_CFLAGS="${CFLAGS}"

	use python && distutils-r1_src_compile
}

src_install() {
	dobin bin/bro
	dolib.a libbrotli.a # No shared library is currently provided

	use python && distutils-r1_src_install

	use doc && dodoc docs/*
}

src_test() {
	tc-export CC
	emake test CUSTOM_CFLAGS="${CFLAGS}"
}
