# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font

DESCRIPTION="Classic fonts from DOS-era IBM PCs and compatibles"
HOMEPAGE="http://int10h.org/oldschool-pc-fonts/"
SRC_URI="http://int10h.org/oldschool-pc-fonts/download/ultimate_oldschool_pc_font_pack_v${PV}.zip"

LICENSE="CC-BY-SA-4.0"
SLOT="0"
KEYWORDS="alpha amd64 arm arm64 hppa ia64 ~mips ppc ppc64 s390 sh sparc x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~arm-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~m68k-mint ~sparc-solaris ~x64-solaris ~x86-solaris"
IUSE="+px437 +pxplus"

BDEPEND="app-arch/unzip"
DEPEND=""
RDEPEND=""

DOCS="README.NFO"

S="${WORKDIR}"
FONT_SUFFIX="ttf"
FONT_S=( "Px437" "PxPlus" )

src_prepare() {
	mv "Px437 (TrueType - DOS charset)" "Px437" || die
	mv "PxPlus (TrueType - extended charset)" "PxPlus" || die
	eapply_user
}
