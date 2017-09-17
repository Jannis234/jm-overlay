# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit font

DESCRIPTION="The Orange Juice font"
HOMEPAGE="http://www.dafont.com/slimfit.font"

SRC_URI="http://dl.dafont.com/dl/?f=orange_juice -> orange_juice-${PV}.zip"
LICENSE="free-noncomm"

SLOT="0"
KEYWORDS="alpha amd64 arm arm64 hppa ia64 ~mips ppc ppc64 s390 sh sparc x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~arm-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~m68k-mint ~sparc-solaris ~x64-solaris ~x86-solaris"
IUSE=""
DEPEND="app-arch/unzip"
RDEPEND=""

S="${WORKDIR}"
FONT_S="${S}"
FONT_SUFFIX="ttf"
DOCS="ReadMe.txt"

src_prepare() {

	# Remove spaces from the filename
	mv "orange juice 2.0.ttf" "orange_juice.ttf"

}
