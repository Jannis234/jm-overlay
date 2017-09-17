# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils cmake-utils subversion user

DESCRIPTION="A download manager that runs in the background"
HOMEPAGE="http://downloaddaemon.sourceforge.net/"
ESVN_REPO_URI="svn://svn.code.sf.net/p/downloaddaemon/code/trunk"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="net-misc/curl"
DEPEND="${RDEPEND}"

CMAKE_USE_DIR="${S}/src/daemon"
ESVN_RESTRICT="export"

src_unpack() {

	subversion_src_unpack

	local S="${S}/${S_dest}"
	mkdir -p "${S}"
	local repo_uri="$(subversion__get_repository_uri "${1:-${ESVN_REPO_URI}}")"
	local wc_path="$(subversion__get_wc_path "${repo_uri}")"
	cd "${wc_path}"
	rsync -rlpgo . "${S}"

}

src_prepare() {

	# Don't compile plugins for filehosters that don't exist anymore
	epatch "${FILESDIR}/remove_useless_plugins.patch"

}

src_install() {

	cmake-utils_src_install
	dodoc AUTHORS CHANGES INSTALLING DEVELOPING TODO
	rm "${D}/usr/share/downloaddaemon/LICENCE"

	rm "${D}/etc/init.d/downloadd"
	cp "${FILESDIR}/downloadd_openrc" "${D}/etc/init.d/downloadd"
	chmod +x "${D}/etc/init.d/downloadd"

}

pkg_postinst() {

	elog "This package has several optional runtime dependencies:"
	elog "For automatic file unpacking, it can use the following tools:"
	elog "app-arch/tar, app-arch/unrar, app-arch/unzip, app-misc/lxsplit"
	elog "To auto-solve captchas when downloading from certain filehosters, install"
	elog "app-text/gocr and media-libs/netpbm"
	elog ""
	elog "Remeber that you need to modify /etc/downloaddaemon/downloaddaemon.conf"
	elog "to inform DownloadDaemom that these tools are installed"

	enewgroup downloadd
	enewuser downloadd -1 -1 /etc/downloaddaemon downloadd
	mkdir -p /var/downloads
	chown -R downloadd:downloadd /etc/downloaddaemon /var/downloads

}
