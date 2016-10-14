# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit font

DESCRIPTION="The Digital 7 font"
HOMEPAGE="http://www.dafont.com/digital-7.font"

SRC_URI="http://dl.dafont.com/dl/?f=digital_7 -> digital_7-${PV}.zip"
LICENSE="free-noncomm"

SLOT="0"
KEYWORDS="alpha amd64 arm arm64 hppa ia64 ~mips ppc ppc64 s390 sh sparc x86 ~amd64-fbsd ~x86-fbsd ~x86-interix ~amd64-linux ~arm-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~m68k-mint ~sparc-solaris ~x64-solaris ~x86-solaris"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND=""

RESTRICT="mirror bindist"

S="${WORKDIR}"
FONT_S="${S}"
FONT_SUFFIX="ttf"
DOCS="readme.txt"
