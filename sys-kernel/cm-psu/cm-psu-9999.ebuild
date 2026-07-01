# Copyright 2023-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 linux-mod-r1

DESCRIPTION="Linux hwmon driver for Cooler Master power supplies"
HOMEPAGE="https://github.com/Jannis234/cm-psu"
EGIT_REPO_URI="https://github.com/Jannis234/cm-psu.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	local modlist=( "cm-psu=kernel/drivers/hwmon::" )
	local modargs=( KERNELDIR="${KV_OUT_DIR}" )
	linux-mod-r1_src_compile
}
