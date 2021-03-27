# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit font

DESCRIPTION="The Orange Juice font"
HOMEPAGE="http://www.dafont.com/slimfit.font"

SRC_URI="http://dl.dafont.com/dl/?f=orange_juice -> orange_juice-${PV}.zip"
LICENSE="free-noncomm"

SLOT="0"
KEYWORDS="~alpha amd64 arm ~arm64 hppa ~ia64 ~mips ppc ppc64 ~s390 sparc x86 ~amd64-linux ~x86-linux"
IUSE=""

BDEPEND="app-arch/unzip"
DEPEND=""
RDEPEND=""

S="${WORKDIR}"
FONT_S="${S}"
FONT_SUFFIX="ttf"
DOCS="ReadMe.txt"

src_prepare() {
	mv "orange juice 2.0.ttf" "orange_juice.ttf"
	eapply_user
}
