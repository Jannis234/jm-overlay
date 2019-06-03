# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{5,6} pypy pypy3 )

inherit git-r3 python-r1 linux-info systemd

DESCRIPTION="Dynamically edit AMD Ryzen processor P-States"
HOMEPAGE="https://github.com/r4m0n/ZenStates-Linux"
EGIT_REPO_URI="https://github.com/r4m0n/ZenStates-Linux.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="togglecode"

RDEPEND="togglecode? ( dev-python/portio[${PYTHON_USEDEP}] )"
DEPEND="${RDEPEND}"

CONFIG_CHECK="X86_MSR"

src_install() {
	do_install() {
		python_newscript zenstates.py zenstates
		use togglecode && python_newscript togglecode.py togglecode
	}
	python_foreach_impl do_install
	newinitd "${FILESDIR}"/disable-c6 disable-c6
	systemd_dounit "${FILESDIR}"/disable-c6.service
	dodoc README.md
}
