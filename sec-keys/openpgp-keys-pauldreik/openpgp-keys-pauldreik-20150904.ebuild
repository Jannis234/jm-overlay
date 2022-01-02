# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="OpenPGP keys used by Paul Dreik"
HOMEPAGE="https://rdfind.pauldreik.se/"
SRC_URI="http://keyserver.ubuntu.com:11371/pks/lookup?op=get&search=0x2E479B1D5AD85FC43972F0B15C4A26CD4CC8C397 -> 2E479B1D5AD85FC43972F0B15C4A26CD4CC8C397.asc"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ppc64 ~riscv ~s390 ~sparc x86"

S="${WORKDIR}"

src_install() {
	local files=( ${A} )
	insinto /usr/share/openpgp-keys
	newins - pauldreik.asc < <(cat "${files[@]/#/${DISTDIR}/}")
}
