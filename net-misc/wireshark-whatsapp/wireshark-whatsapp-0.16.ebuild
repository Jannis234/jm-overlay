# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils

DESCRIPTION="Whatsapp dissector plugin for wireshark"
HOMEPAGE="https://github.com/davidgfnet/wireshark-whatsapp"
SRC_URI="https://github.com/davidgfnet/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DEPEND="dev-libs/glib:2
	dev-libs/libgcrypt:0
	net-analyzer/wireshark:="
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}/${PN}-nostrip.patch"
	"${FILESDIR}/${P}-tvb_length.patch" )

get_PV() { local pv=$(best_version $1); pv=${pv#$1-}; pv=${pv%-r*}; pv=${pv//_}; echo ${pv}; }

src_install() {
	insinto "/usr/$(get_libdir)/wireshark/plugins/$(get_PV net-analyzer/wireshark)/"
	doins "${BUILD_DIR}/whatsapp.so"

	dodoc README.md AUTHORS ChangeLog
	use doc && dodoc protocol-spec.txt
}
