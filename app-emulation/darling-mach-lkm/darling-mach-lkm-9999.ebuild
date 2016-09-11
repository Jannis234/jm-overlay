# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3 linux-mod udev user

DESCRIPTION="Kernel module for app-emulation/darling"
HOMEPAGE="https://www.darlinghq.org/"
EGIT_REPO_URI="https://github.com/darlinghq/darling.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="-* ~amd64"
IUSE=""

RDEPEND="virtual/udev"
DEPEND="virtual/linux-sources"

MODULE_NAMES="darling-mach(misc:${S}/src/lkm:${S}/src/lkm"
BUILD_PARAMS="-j1 -C ${KERNEL_DIR} M=${S}/src/lkm"
BUILD_TARGETS="clean modules"

src_install() {
	linux-mod_src_install
	udev_dorules "${FILESDIR}/99-darling-mach.rules"
}

pkg_postinst() {
	linux-mod_pkg_postinst
	enewgroup darling

	ewarn "To use darling, you have to add yourself to the \"darling\" group"
	ewarn "and load the \"darling-mach\" kernel module"
	ewarn ""
	ewarn "Note that the kernel module is likely to have stability/security problems!"
	ewarn "Only add trusted users to the \"darling\" group!"
}
