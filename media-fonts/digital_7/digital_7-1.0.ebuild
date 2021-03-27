# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit font

DESCRIPTION="The Digital 7 font"
HOMEPAGE="http://www.dafont.com/digital-7.font"

SRC_URI="http://dl.dafont.com/dl/?f=digital_7 -> digital_7-${PV}.zip"
LICENSE="free-noncomm"

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
DOCS="readme.txt"
