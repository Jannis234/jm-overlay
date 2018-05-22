# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6} pypy pypy3 )
inherit distutils-r1 git-r3

DESCRIPTION=""
HOMEPAGE="https://github.com/webrecorder/wsgiprox https://pypi.org/project/wsgiprox"
EGIT_REPO_URI="https://github.com/webrecorder/wsgiprox.git"
EGIT_COMMIT="c44c92ff1af6fd51a162a6e387b599b2a597235b"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-python/six[${PYTHON_USEDEP}]
	>=dev-python/certauth-1.2[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

src_prepare() {
	eapply_user
	rm -r test || die # Build system wants to install this
}

DOCS=( README.rst )
