# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit check-reqs

DESCRIPTION="Final, definitive revision of the former Evanessence soundfont"
HOMEPAGE="http://www.synthfont.com/punbb/viewtopic.php?id=167"
SRC_URI="Musyng_Kite.sf2"

LICENSE="free-noncomm"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="timidity"

RESTRICT="fetch binchecks"
CHECKREQS_DISK_USR="1G"
S="${WORKDIR}"

# eselect-timidity has a hardcoded list of modules available in portage
# We need to use a patched version to add this soundfont to that list
RDEPEND="timidity? ( =app-eselect/eselect-timidity-20110513-r1 )"
DEPEND=""

pkg_nofetch() {
	einfo "Please download \"Musyng Kite.sfpack\" from"
	einfo "${SRC_URI}"
	einfo ""
	einfo "Unpack it using the non-free SFPack utility from"
	einfo "http://personalcopy.com/sfpack.htm"
	einfo "(you can use app-emulation/wine to run it)"
	einfo ""
	einfo "Finally, move the SF2 file to"
	einfo "${DISTDIR}/${SRC_URI}"
}

src_install() {
	insinto /usr/share/sounds/sf2
	doins "${DISTDIR}/${SRC_URI}"

	if use timidity; then
		insinto /usr/share/timidity/musyng-kite
		doins "${FILESDIR}/timidity.cfg"
	fi
}
