# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Manages configuration of TiMidity++ patchsets"
HOMEPAGE="https://www.gentoo.org/"
SRC_URI="mirror://gentoo/timidity.eselect-${PV}.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=app-admin/eselect-1.2.3"
S="${WORKDIR}"

src_prepare() {
	eapply -p0 "${FILESDIR}/eselect-timidity-add-musyng-kite.patch"
	eapply_user
}

src_install() {
	insinto /usr/share/eselect/modules
	newins "${WORKDIR}/timidity.eselect-${PV}" timidity.eselect
}
