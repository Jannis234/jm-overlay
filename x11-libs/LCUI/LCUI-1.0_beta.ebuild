# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools multilib-minimal

MyPV="1.0-beta"
MyP="${PN}-${MyPV}"

DESCRIPTION="A small C library for building user interfaces with C, XML and CSS"
HOMEPAGE="http://lcui.org/"
SRC_URI="https://github.com/lc-soft/LCUI/archive/v${MyPV}.tar.gz -> ${MyP}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="X truetype png jpeg xml static-libs l10n_zh"

RDEPEND="X? ( x11-libs/libX11[${MULTILIB_USEDEP}] )
	png? ( media-libs/libpng:0=[${MULTILIB_USEDEP}] )
	jpeg? ( virtual/jpeg:0[${MULTILIB_USEDEP}] )
	truetype? ( media-libs/freetype[${MULTILIB_USEDEP}] )
	xml? ( dev-libs/libxml2[${MULTILIB_USEDEP}] )"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${MyP}"

src_prepare() {
	eapply_user
	eautoreconf
	multilib_copy_sources
}

multilib_src_configure() {
	# Building without pthread fails
	econf \
		--enable-shared \
		$(use_enable static-libs static) \
		$(use_with png) \
		$(use_with jpeg) \
		$(use_enable truetype font-engine) \
		$(use_enable X video-output) \
		$(use_enable xml lcui-builder) \
		--with-pthread
}

multilib_src_install_all() {
	dodoc AUTHORS README.md docs/CHANGES.md docs/FAQ.md
	use l10n_zh && dodoc README.zh-cn.md docs/CHANGES.zh-cn.md docs/FAQ.zh-cn.md docs/CodingStyle.zh-cn.md
}
