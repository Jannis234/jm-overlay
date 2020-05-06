# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs

DESCRIPTION="All-in-one utility to calculate and verify checksums"
HOMEPAGE="https://github.com/Jannis234/xsum"
SRC_URI="https://github.com/Jannis234/xsum/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="openmp botan cppcrypto crypto++ glib gnutls mbedtls mhash nettle nss blake2 gcrypt lzma sodium -openssl -libressl rhash xxhash zlib"

DEPEND="botan? ( dev-libs/botan:2= )
	cppcrypto? ( dev-libs/cppcrypto:= )
	crypto++? ( dev-libs/crypto++:= )
	glib? ( dev-libs/glib:2= )
	gnutls? ( net-libs/gnutls:= )
	mbedtls? ( net-libs/mbedtls:= )
	mhash? ( app-crypt/mhash:= )
	nettle? ( dev-libs/nettle:= )
	nss? ( dev-libs/nss:= )
	blake2? ( app-crypt/libb2:= )
	gcrypt? ( >=dev-libs/libgcrypt-1.7.0:= )
	lzma? ( app-arch/xz-utils:= )
	sodium? ( dev-libs/libsodium:= )
	openssl? ( dev-libs/openssl:= )
	libressl? ( dev-libs/libressl:= )
	rhash? ( app-crypt/rhash:= )
	xxhash? ( dev-libs/xxhash:= )
	zlib? ( sys-libs/zlib:= )"
RDEPEND="${DEPEND}"
BDEPEND="sys-apps/help2man"

REQUIRED_USE="?? ( openssl libressl )"
RESTRICT="openssl? ( bindist )
	libressl? ( bindist )"

xsum_make() {
	tc-export CC AR RANLIB PKG_CONFIG
	mingw=0
	[[ "${CHOST}" == *-mingw* || "${CHOST}" == mingw* ]] && mingw=1
	emake CCFLAGS="${CFLAGS}" \
		WITH_OPENMP=$(usex openmp 1 0) \
		WITH_BOTAN=$(usex botan 1 0) \
		WITH_CPPCRYPTO=$(usex cppcrypto 1 0) \
		WITH_CRYPTOPP=$(usex crypto++ 1 0) \
		WITH_GLIB=$(usex glib 1 0) \
		WITH_GNUTLS=$(usex gnutls 1 0) \
		WITH_MBEDTLS=$(usex mbedtls 1 0) \
		WITH_MHASH=$(usex mhash 1 0) \
		WITH_NETTLE=$(usex nettle 1 0) \
		WITH_NSS=$(usex nss 1 0) \
		WITH_LIBB2=$(usex blake2 1 0) \
		WITH_LIBGCRYPT=$(usex gcrypt 1 0) \
		WITH_LIBLZMA=$(usex lzma 1 0) \
		WITH_LIBSODIUM=$(usex sodium 1 0) \
		WITH_OPENSSL=$(usex openssl 1 $(usex libressl 1 0)) \
		WITH_RHASH=$(usex rhash 1 0) \
		WITH_XXHASH=$(usex xxhash 1 0) \
		WITH_ZLIB=$(usex zlib 1 0) \
		WITH_WINDOWS_CNG=$mingw \
		$@
}

src_compile() {
	xsum_make all
}

src_install() {
	xsum_make PREFIX="${ED}/usr" install
	dodoc README.md CHANGELOG
}

src_test() {
	xsum_make check
}
