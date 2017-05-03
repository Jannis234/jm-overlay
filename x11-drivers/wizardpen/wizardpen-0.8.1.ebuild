# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit versionator

DESCRIPTION="A Linux/HAL/udev/X11 driver for most non-Wacom graphics pads"
HOMEPAGE="https://launchpad.net/wizardpen"
SRC_URI="https://launchpad.net/wizardpen/trunk/$(get_version_component_range 1-2)/+download/xorg-input-wizardpen-${PV}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="x11-base/xorg-server:="
RDEPEND="${DEPEND}"

S="${WORKDIR}/xorg-input-${P}"

src_prepare() {
	if has_version ">=x11-base/xorg-server-1.19.0"; then
		eapply "${FILESDIR}/${P}-xorg-1.19.0.patch"
	fi
	eapply_user
}

src_configure() {
	econf --with-udev-rules-dir=/lib/udev/rules.d
}
