# Copyright 1999-2022 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8,9,10,11} pypy3 )

inherit git-r3 python-r1

DESCRIPTION="Collect bcache statistics using the Collectd Exec plugin"
HOMEPAGE="https://github.com/pommi/collectd-bcache"
EGIT_REPO_URI="https://github.com/pommi/collectd-bcache.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${PYTHON_DEPS}
	app-metrics/collectd[collectd_plugins_exec]"

src_install() {
	do_install() {
		python_doscript "${PN}"
	}
	python_foreach_impl do_install
	dodoc README.md
}

pkg_postinst() {
	elog "To use this package, enable the collectd exec plugin and add"
	elog "   Exec \"collectd\" \"${EROOT}usr/bin/${PN}\""
	elog "to the plugin's configuration"
}
