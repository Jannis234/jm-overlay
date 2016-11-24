# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils qmake-utils

DESCRIPTION="Lightweight systray IMAP mail checker"
HOMEPAGE="https://www.linux-apps.com/content/show.php/ImapQuickCheck?content=110821"
SRC_URI="https://dl.opendesktop.org/api/files/download/id/1466644229/110821-${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-qt/qtcore:4
	dev-qt/qtgui:4
	dev-qt/qtsql:4[sqlite]"
RDEPEND="${DEPEND}
	dev-lang/python[sqlite]"

src_configure() {
	eqmake4 ImapQuickCheck.pro
}

src_install() {
	dobin ${PN}
	dodoc README.txt
	domenu ${PN}.desktop
}
