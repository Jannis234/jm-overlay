# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3 eutils

DESCRIPTION="A header-only C++ logging library"
HOMEPAGE="https://github.com/emilk/loguru"

EGIT_REPO_URI="https://github.com/emilk/loguru.git"
EGIT_COMMIT="95701fb9a8f371e0d2c90b379d796c8edd5016a2"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

RESTRICT="test" # Needs user interaction

DEPEND=""
RDEPEND=""

src_prepare() {
	epatch_user
}

src_install() {
	insinto /usr/include/loguru
	doins loguru.hpp

	dodoc README.md
	dodoc -r images
	use examples && dodoc -r loguru_example
}
