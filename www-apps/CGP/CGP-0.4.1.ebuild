# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit webapp eutils

DESCRIPTION="Graphical web-based front-end for visualizing RRD collected by collectd"
HOMEPAGE="https://pommi.nethuis.nl/category/cgp/ https://github.com/pommi/CGP"
SRC_URI="https://github.com/pommi/CGP/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="+json apache2"

RDEPEND="virtual/httpd-php
	>=dev-lang/php-5.0[json?]
	net-analyzer/rrdtool[graph]"

src_prepare() {
	epatch_user
}

src_install() {
	dodoc doc/INSTALL doc/CHANGELOG

	insinto "${MY_HTDOCSDIR}"
	doins -r "inc" "js" "layout" "plugin" "type" "conf" *.php
	use apache2 && doins ".htaccess"
	insinto "${MY_HTDOCSDIR}/conf"
	doins "${FILESDIR}/config.local.php"
	webapp_configfile "${MY_HTDOCSDIR}/conf/config.php" "${MY_HTDOCSDIR}/conf/config.local.php"

	webapp_src_install
}

pkg_postinst() {
	webapp_pkg_postint

	elog "Please make sure that PHP is allowed to execute /usr/bin/rrdtool"
}
