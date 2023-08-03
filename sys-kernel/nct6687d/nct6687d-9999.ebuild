# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 linux-mod

DESCRIPTION="Linux kernel module for Nuvoton NCT6687-R"
HOMEPAGE="https://github.com/Fred78290/nct6687d"
EGIT_REPO_URI="https://github.com/Fred78290/nct6687d.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

#BUILD_TARGETS="build"
BUILD_PARAMS="KERNEL_DIR=${KERNEL_DIR}"
MODULE_NAMES="nct6687(misc:${S}:${S})"

src_prepare() {
	cp "${FILESDIR}/${PN}-Makefile" "Makefile" || die
	eapply_user
}
