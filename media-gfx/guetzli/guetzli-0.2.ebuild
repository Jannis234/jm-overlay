# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit toolchain-funcs

DESCRIPTION="JPEG encoder that aims for excellent compression density at high visual quality"
HOMEPAGE="https://github.com/google/guetzli"
SRC_URI="https://github.com/google/guetzli/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="media-libs/libpng:0
	dev-cpp/gflags
	sys-libs/zlib"
DEPEND="${RDEPEND}"

src_prepare() {
	sed -i "s/-O3//g" guetzli.make || die # Use user-specified optimization flags
	sed -i "s/\$\(LDFLAGS\) -s/\$\(LDFLAGS\)/g" # Don't strip the binary
	sed -i "s/-DGFLAGS_NAMESPACE=google/-DGFLAGS_NAMESPACE=gflags/g" guetzli.make || die # Fix building with current dev-cpp/gflags
	eapply_user
}

src_compile() {
	tc-export CXX
	emake verbose=1
}

src_install() {
	dobin bin/Release/guetzli
	dodoc CONTRIBUTING.md README.md
}
