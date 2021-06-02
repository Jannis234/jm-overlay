# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit verify-sig

DESCRIPTION="Rdfind is a program that finds duplicate files"
HOMEPAGE="https://rdfind.pauldreik.se/"
SRC_URI="https://rdfind.pauldreik.se/${P}.tar.gz
	verify-sig? ( https://rdfind.pauldreik.se/${P}.tar.gz.asc )"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="test"

DEPEND="dev-libs/nettle"
RDEPEND="${DEPEND}"
BDEPEND="verify-sig? ( app-crypt/openpgp-keys-pauldreik )"

VERIFY_SIG_OPENPGP_KEY_PATH=/usr/share/openpgp-keys/pauldreik.asc
