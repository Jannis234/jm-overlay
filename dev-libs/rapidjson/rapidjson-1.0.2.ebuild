# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils

DESCRIPTION="Fast JSON parser/generator for C++"
HOMEPAGE="https://github.com/miloyip/rapidjson"
SRC_URI="https://github.com/miloyip/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT BSD JSON"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc examples"

DEPEND="doc? ( app-doc/doxygen[dot] )"
RDEPEND=""

DOCS="readme.md CHANGELOG.md"

src_configure() {
	local mycmakeargs=(
		-DRAPIDJSON_BUILD_TESTS=OFF
		$(cmake-utils_use doc RAPIDJSON_BUILD_DOC)
		$(cmake-utils_use examples RAPIDJSON_BUILD_EXAMPLES)
	)
	cmake-utils_src_configure
}
