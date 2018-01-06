# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-multilib

DESCRIPTION="A Persistent Key-Value Store for Flash and RAM Storage"
HOMEPAGE="http://rocksdb.org/"
SRC_URI="https://github.com/facebook/rocksdb/archive/${P}.tar.gz"

LICENSE="|| ( GPL-2 Apache-2.0 ) BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="static-libs minimal bzip2 lz4 snappy zlib zstd kernel_linux"

RDEPEND="bzip2? ( app-arch/bzip2[${MULTILIB_USEDEP}] )
	lz4? ( app-arch/lz4[${MULTILIB_USEDEP}] )
	snappy? ( app-arch/snappy[${MULTILIB_USEDEP}] )
	zlib? ( sys-libs/zlib[${MULTILIB_USEDEP}] )
	zstd? ( app-arch/zstd[${MULTILIB_USEDEP}] )"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}-${P}"
DOCS=( AUTHORS CONTRIBUTING.md DEFAULT_OPTIONS_HISTORY.md DUMP_FORMAT.md HISTORY.md LANGUAGE-BINDINGS.md README.md ROCKSDB_LITE.md USERS.md )

multilib_src_configure() {
	# Turning off "portable" would only add march=native to CXXFLAGS
	# Jemalloc currently fails to build
	# Librados is currently not available in portage
	# Tools don't seem to be installed
	# Tests don't build in the release configuration
	local mycmakeargs=(
		-DFAIL_ON_WARNINGS=OFF
		-DFORCE_SSE42=OFF
		-DPORTABLE=ON
		-DROCKSDB_LITE=$(usex minimal)
		-DWITH_ASAN=OFF
		-DWITH_BZ2=$(usex bzip2)
		-DWITH_FALLOCATE=$(usex kernel_linux)
		-DWITH_JEMALLOC=OFF
		-DWITH_JNI=OFF
		-DWITH_LIBRADOS=OFF
		-DWITH_LZ4=$(usex lz4)
		-DWITH_SNAPPY=$(usex snappy)
		-DWITH_TESTS=OFF
		-DWITH_TOOLS=OFF
		-DWITH_TSAN=OFF
		-DWITH_UBSAN=OFF
		-DWITH_ZLIB=$(usex zlib)
		-DWITH_ZSTD=$(usex zstd)
	)
	cmake-utils_src_configure
}

multilib_src_install() {
	cmake-utils_src_install
	if ! use static-libs; then
		rm "${ED}usr/$(get_libdir)/librocksdb.a" || die
	fi
}
