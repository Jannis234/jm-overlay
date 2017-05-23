# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit toolchain-funcs

DESCRIPTION="zstd fast compression library"
HOMEPAGE="http://facebook.github.io/zstd/"
SRC_URI="https://github.com/facebook/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="threads zlib static-libs doc examples"

RDEPEND="zlib? ( sys-libs/zlib )"
DEPEND="${RDEPEND}"

PATCHES=( "${FILESDIR}/${P}-fix_build_system.patch" "${FILESDIR}/${P}-disable_auto_detect.patch" )

src_compile() {
	emake \
		CC="$(tc-getCC)" \
		AR="$(tc-getAR)" \
		PREFIX="${EPREFIX}/usr" \
		LIBDIR="${EPREFIX}/usr/$(get_libdir)" \
		HAVE_THREAD="$(usex threads 1 0)"\
		HAVE_ZLIB="$(usex zlib 1 0)" zstd

	emake -C lib \
		CC="$(tc-getCC)" \
		AR="$(tc-getAR)" \
		PREFIX="${EPREFIX}/usr" \
		LIBDIR="${EPREFIX}/usr/$(get_libdir)" libzstd libzstd.a
}

src_install() {
	emake \
		DESTDIR="${D}" \
		PREFIX="${EPREFIX}/usr" \
		LIBDIR="${EPREFIX}/usr/$(get_libdir)" install
	einstalldocs

	if ! use static-libs; then
		rm "${ED%/}"/usr/$(get_libdir)/libzstd.a || die
	fi

	use doc && dodoc doc/zstd_manual.html doc/zstd_compression_format.md
	use examples && dodoc -r examples
}
