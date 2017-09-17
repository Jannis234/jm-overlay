# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit font

DESCRIPTION="The Hanging Letters font"
HOMEPAGE="http://www.dafont.com/hanging-letters.font"

SRC_URI="http://dl.dafont.com/dl/?f=hanging_letters -> ${P}.zip"
LICENSE="free-noncomm"

SLOT="0"
KEYWORDS="alpha amd64 arm arm64 hppa ia64 ~mips ppc ppc64 s390 sh sparc x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~arm-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~m68k-mint ~sparc-solaris ~x64-solaris ~x86-solaris"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND=""

RESTRICT="mirror bindist"

S="${WORKDIR}"
FONT_S="${S}"
FONT_SUFFIX="ttf"
DOCS="Hanged_Letters.pdf"

src_prepare() {
	mv Hanged\ Letters.pdf Hanged_Letters.pdf
}
