# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font

DESCRIPTION="Classic fonts from DOS-era IBM PCs and compatibles"
HOMEPAGE="http://int10h.org/oldschool-pc-fonts/"
SRC_URI="https://int10h.org/oldschool-pc-fonts/download/oldschool_pc_font_pack_v${PV}_linux.zip"

LICENSE="CC-BY-SA-4.0"
SLOT="0"
KEYWORDS="alpha amd64 arm arm64 hppa ia64 ~mips ppc ppc64 s390 sh sparc x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~arm-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~m68k-mint ~sparc-solaris ~x64-solaris ~x86-solaris"
IUSE="doc +otb-bm +ttf-ac +ttf-mx +ttf-px"

BDEPEND="app-arch/unzip"
DEPEND=""
RDEPEND=""

DOCS=( "README.TXT" "UPGRADING.TXT" )

S="${WORKDIR}"

src_prepare() {
	eapply_user
	# Get rid of spaces in filenames
	mv "otb - Bm (linux bitmap)" "Bm-linux_bitmap" || die
	mv "ttf - Ac (aspect-corrected)" "Ac-aspect_corrected" || die
	mv "ttf - Mx (mixed outline+bitmap)" "Mx-mixed_outline_bitmap" || die
	mv "ttf - Px (pixel outline)" "Px-pixel_outline" || die
}

src_install() {
	use otb-bm && FONT_S="Bm-linux_bitmap" FONT_SUFFIX="otb" font_src_install
	use ttf-ac && FONT_S="Ac-aspect_corrected" FONT_SUFFIX="ttf" font_src_install
	use ttf-mx && FONT_S="Mx-mixed_outline_bitmap" FONT_SUFFIX="ttf" font_src_install
	use ttf-px && FONT_S="Px-pixel_outline" FONT_SUFFIX="ttf" font_src_install
	use doc && dodoc docs/*.pdf
}
