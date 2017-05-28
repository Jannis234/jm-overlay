# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6} pypy )

inherit python-r1

DESCRIPTION="Command line client for interacting with cloud storage pCloud"
HOMEPAGE="https://github.com/abbat/pclcmd"
SRC_URI="https://github.com/abbat/pclcmd/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="dev-python/python-dateutil[${PYTHON_USEDEP}]"

src_install() {
	do_install() {
		python_newscript pclcmd.py pclcmd
	}
	python_foreach_impl do_install
	dodoc README.md
}

pkg_postinst() {
	if ! has_version dev-python/progressbar; then
		elog "You can install dev-python/progressbar for optional fancy progress bars"
	fi
}
