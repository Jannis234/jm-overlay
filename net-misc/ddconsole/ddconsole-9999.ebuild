# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils cmake-utils subversion

DESCRIPTION="CLI interface for net-misc/downloaddaemon"
HOMEPAGE="http://downloaddaemon.sourceforge.net/"
ESVN_REPO_URI="svn://svn.code.sf.net/p/downloaddaemon/code/trunk"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

CMAKE_USE_DIR="${S}/src/ddconsole"
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

src_install() {

	cmake-utils_src_install
	dodoc AUTHORS CHANGES INSTALLING DEVELOPING TODO

}
