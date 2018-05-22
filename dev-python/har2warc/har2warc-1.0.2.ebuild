# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5,6} pypy pypy3 )
inherit distutils-r1 git-r3

DESCRIPTION=""
HOMEPAGE="https://github.com/webrecorder/har2warc https://pypi.org/project/har2warc/"
EGIT_REPO_URI="https://github.com/webrecorder/har2warc.git"
EGIT_COMMIT="23afa05a8c4bb1ca93bed2e0822e34de3f47058a"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-python/warcio[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	dev-python/http_status[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

DOCS=( README.rst )
