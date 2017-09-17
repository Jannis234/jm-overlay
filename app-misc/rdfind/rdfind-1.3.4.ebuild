# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="Rdfind is a program that finds duplicate files"
HOMEPAGE="https://rdfind.pauldreik.se/"
SRC_URI="https://rdfind.pauldreik.se/rdfind-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="test"

DEPEND="dev-libs/nettle"
RDEPEND="${DEPEND}"
