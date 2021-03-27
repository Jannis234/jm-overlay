# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit font

DESCRIPTION="The Wrong Time, Wrong Place font"
HOMEPAGE="http://www.dafont.com/wrong-time-wrong-place.font"

SRC_URI="http://dl.dafont.com/dl/?f=wrong_time_wrong_place -> wrong_time_wrong_place-${PV}.zip"
LICENSE="free-noncomm"

SLOT="0"
KEYWORDS="~alpha amd64 arm ~arm64 hppa ~ia64 ~mips ppc ppc64 ~s390 sparc x86 ~amd64-linux ~x86-linux"
IUSE=""

BDEPEND="app-arch/unzip"
DEPEND=""
RDEPEND=""

RESTRICT="bindist mirror"

S="${WORKDIR}"
FONT_S="${S}"
FONT_SUFFIX="ttf"
DOCS="Readme.txt"

src_prepare() {
	mv "Read me.txt" "Readme.txt" || die
	mv "Wrong time, wrong place.ttf" "Wrong_time_wrong_place.ttf" || die
	eapply_user
}
