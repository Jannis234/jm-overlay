# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit font

DESCRIPTION="The Street 2 Art font"
HOMEPAGE="http://www.dafont.com/street-2-art.font"

SRC_URI="http://dl.dafont.com/dl/?f=street_2_art -> street_2_art-${PV}.zip"
LICENSE="street_2_art"

SLOT="0"
KEYWORDS="alpha amd64 arm arm64 hppa ia64 ~mips ppc ppc64 s390 sh sparc x86 ~amd64-fbsd ~x86-fbsd ~x86-interix ~amd64-linux ~arm-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~m68k-mint ~sparc-solaris ~x64-solaris ~x86-solaris"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND=""

S="${WORKDIR}"
FONT_S="${S}"
FONT_SUFFIX="ttf"
DOCS="Street_2_Art.pdf"

src_prepare() {
	mv "Street 2 Art.pdf" "Street_2_Art.pdf" || die
}
