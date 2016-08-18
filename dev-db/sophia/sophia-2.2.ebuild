# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit toolchain-funcs

GIT_REV="3214ef8" # Update this on version bumps

DESCRIPTION="Modern transactional key-value/row storage library"
HOMEPAGE="http://sophia.systems/"
SRC_URI="https://github.com/pmwkaa/sophia/archive/version_${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc examples static-libs"

DEPEND=""
RDEPEND="${DEPEND}"
S="${WORKDIR}/${PN}-version_${PV}"

src_prepare() {
	eapply "${FILESDIR}/sophia-2.2-makefile.patch"
	# The git revision is used as part of the version string, but the build system expects a git repository
	sed -i "s/\`git rev-parse --short HEAD\`/${GIT_REV}/g" sophia/build || die
	eapply_user
}

src_compile() {
	tc-export CC
	export CFLAGS_OPT="${CFLAGS}"

	emake dynamic
	use static-libs && emake static
}

src_install() {
	dolib.so libsophia.so*
	use static-libs && dolib.a libsophia.a

	dodoc README.md
	use examples && dodoc -r example
	docinto markdown
	use doc && dodoc -r documentation/*
}

src_test() {
	cd test || die
	tc-export CC
	export CFLAGS_OPT="${CFLAGS}"

	emake sophia-test
	./sophia-test || die "Tests failed"
}
