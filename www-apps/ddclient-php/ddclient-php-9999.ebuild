# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit subversion webapp

DESCRIPTION="PHP web-interface for net-misc/downloaddaemon"
HOMEPAGE="http://downloaddaemon.sourceforge.net/"
ESVN_REPO_URI="svn://svn.code.sf.net/p/downloaddaemon/code/trunk"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="virtual/httpd-php"

src_install() {
	dodoc AUTHORS CHANGES TODO DEVELOPING

	cd "${S}/src/ddclient-php"
	insinto "${MY_HTDOCSDIR}"
	doins -r .

	webapp_src_install
}
