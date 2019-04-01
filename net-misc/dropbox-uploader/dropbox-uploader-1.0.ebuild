# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION=" BASH script to upload, download, list or delete files from Dropbox"
HOMEPAGE="https://github.com/andreafabrizi/Dropbox-Uploader/"
SRC_URI="https://github.com/andreafabrizi/Dropbox-Uploader/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}/Dropbox-Uploader-${PV}"
RESTRICT="test" # Needs to interact with dropbox

DEPEND=""
RDEPEND="app-shells/bash
	net-misc/curl[ssl]"

src_prepare() {
	eapply "${FILESDIR}/dropbox-uploader-config-file.patch"
	eapply "${FILESDIR}/dropbox-uploader-dropshell-path.patch"
	eapply_user
}

src_install() {
	newbin dropbox_uploader.sh dropbox-uploader
	newbin dropShell.sh dropshell
	dodoc README.md CHANGELOG.md
	insinto /etc
	doins "${FILESDIR}/dropbox_uploader.conf"
}
