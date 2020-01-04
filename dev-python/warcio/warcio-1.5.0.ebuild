# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{6,7,8} pypy pypy3 )
inherit distutils-r1 git-r3

DESCRIPTION="Streaming WARC/ARC library for fast web archive IO"
HOMEPAGE="https://github.com/webrecorder/warcio https://pypi.org/project/warcio/"
EGIT_REPO_URI="https://github.com/webrecorder/warcio.git"
EGIT_COMMIT="ed7ebfd7c518bb6ff7e43bfc5d76285ea6eeb8b0"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-python/six[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

DOCS=( README.rst CHANGELIST.rst )

src_prepare() {
	eapply_user
	rm -rf "test" || die # Buildsystem wants to install this
}
