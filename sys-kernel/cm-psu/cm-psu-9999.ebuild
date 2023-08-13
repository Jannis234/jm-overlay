# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 linux-mod

DESCRIPTION="Linux hwmon driver for Cooler Master power supplies"
HOMEPAGE="https://github.com/Jannis234/cm-psu"
EGIT_REPO_URI="https://github.com/Jannis234/cm-psu.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

BUILD_PARAMS="KERNEL_DIR=${KERNEL_DIR}"
MODULE_NAMES="cm-psu(misc:${S}:${S})"

src_prepare() {
	cp "${FILESDIR}/${PN}-Makefile" "Makefile" || die
	eapply_user
}
