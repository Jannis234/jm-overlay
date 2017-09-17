# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit toolchain-funcs

DESCRIPTION="A header-only C++ logging library"
HOMEPAGE="https://github.com/emilk/loguru"
SRC_URI="https://github.com/emilk/loguru/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples test"

DEPEND="test? ( dev-util/cmake )"
RDEPEND=""

src_prepare() {
	# Disable tests that require user interaction
	eapply "${FILESDIR}/loguru-test-noninteractive.patch"
	eapply_user
}

src_install() {
	insinto /usr/include/loguru
	doins loguru.hpp

	dodoc README.md
	dodoc -r images
	use examples && dodoc -r loguru_example
}

src_test() {
	cd test || die
	tc-export CXX
	./build_and_run.sh || die
}
