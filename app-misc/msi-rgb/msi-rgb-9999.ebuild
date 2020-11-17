# Copyright 2017-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 cargo

DESCRIPTION="Utility for controlling RGB header on some MSI boards"
HOMEPAGE="https://github.com/nagisa/msi-rgb"
SRC_URI="$(cargo_crate_uris ${CRATES})"
EGIT_REPO_URI="https://github.com/nagisa/msi-rgb.git"

LICENSE="ISC MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND=""

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}

pkg_postinst() {
	einfo "This package is not actively maintained anymore."
	einfo "Consider using app-misc/OpenRGB instead."
}
