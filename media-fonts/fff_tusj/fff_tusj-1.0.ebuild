# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit font

DESCRIPTION="Handwritten font based on Georgia Bold"
HOMEPAGE="http://www.formfett.net/tusj-one-handwritten-font/"

SRC_URI="http://www.formfett.net/wp-content/download/FFFTusj.zip"
LICENSE="fff_tusj"

SLOT="0"
KEYWORDS="~alpha amd64 arm ~arm64 hppa ~ia64 ~mips ppc ppc64 ~s390 sparc x86 ~amd64-linux ~x86-linux"
IUSE=""

BDEPEND="app-arch/unzip"
DEPEND=""
RDEPEND=""

RESTRICT="mirror bindist"

S="${WORKDIR}"
FONT_S="${S}"
FONT_SUFFIX="ttf"

src_prepare() {
	rm "._FFF Tusj.ttf" || die
	eapply_user
}
