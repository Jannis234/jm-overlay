# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3

DESCRIPTION="A header-only C++ logging library"
HOMEPAGE="https://github.com/emilk/loguru"

EGIT_REPO_URI="https://github.com/emilk/loguru.git"
EGIT_COMMIT="8671d6d1d693f33774956b0fc388f344a5a2b083"

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
	./build_and_run.sh || die
}
