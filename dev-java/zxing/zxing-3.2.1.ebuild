# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

JAVA_PKG_IUSE="doc source"
JAVA_PKG_WANT_SOURCE="7"

inherit java-pkg-2 java-ant-2

DESCRIPTION="Multi-format 1D/2D barcode image processing library"
HOMEPAGE="https://github.com/zxing/zxing"
SRC_URI="https://github.com/${PN}/${PN}/archive/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

COMMON_DEP=""

RDEPEND=">=virtual/jre-1.7
  ${COMMON_DEP}"
DEPEND=">=virtual/jdk-1.7
  ${COMMON_DEP}"

S="${WORKDIR}/${PN}-${P}"

src_prepare() {
	cp "${FILESDIR}/zxing-build.xml" core/build.xml || die
}

src_configure() {
	cd core || die
	java-ant-2_src_configure
}

src_compile() {
	cd core || die
	java-pkg-2_src_compile
}

src_install() {
	dodoc AUTHORS CHANGES CONTRIBUTING.md README.md

	cd core || die
	java-pkg_newjar "target/core-${PV}.jar" "core.jar"
	use doc && java-pkg_dojavadoc target/site/apidocs
	use source && java-pkg_dosrc src
}
