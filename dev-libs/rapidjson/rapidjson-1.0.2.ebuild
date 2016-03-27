# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils

DESCRIPTION="Fast JSON parser/generator for C++"
HOMEPAGE="https://github.com/miloyip/rapidjson"
SRC_URI="https://github.com/miloyip/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT BSD JSON"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc examples test"

DEPEND="doc? ( app-doc/doxygen[dot] )
	test? (
		dev-cpp/gtest
		dev-util/valgrind
	)"
RDEPEND=""

DOCS="readme.md CHANGELOG.md"

src_prepare() {
	# Rapidjson looks for the gtest source code and compiles it
	# Make it use the system-wide copy
	eapply "${FILESDIR}/rapidjson-system-gtest.patch"

	eapply_user
}

src_configure() {
	local mycmakeargs=(
		-DRAPIDJSON_BUILD_TESTS="$(usex test)"
		-DRAPIDJSON_BUILD_DOC="$(usex doc)"
		-DRAPIDJSON_BUILD_EXAMPLES="$(usex examples)"
	)
	cmake-utils_src_configure
}
