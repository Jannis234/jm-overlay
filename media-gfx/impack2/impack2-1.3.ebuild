# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs

MyPN="ImPack2"
MyP="${MyPN}-${PV}"

DESCRIPTION="An application to convert arbitrary files into images and back"
HOMEPAGE="https://github.com/Jannis234/ImPack2"
SRC_URI="https://github.com/Jannis234/ImPack2/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"
IUSE="X doc crypt avif bmp flif heif jpeg2k jpegls jxr +png tiff webp brotli bzip2 lzma zlib zstd"

DEPEND="crypt? ( dev-libs/nettle:= )
	avif? ( media-libs/libavif:= )
	bmp? ( media-libs/libnsbmp:= )
	flif? ( media-libs/flif:= )
	heif? ( media-libs/libheif:= )
	jpeg2k? ( media-libs/openjpeg:2= )
	jpegls? ( media-libs/charls:= )
	jxr? ( media-libs/jxrlib )
	png? ( media-libs/libpng:= )
	tiff? ( media-libs/tiff:0= )
	webp? ( media-libs/libwebp:= )
	brotli? ( app-arch/brotli:= )
	bzip2? ( app-arch/bzip2:= )
	lzma? ( app-arch/xz-utils:= )
	zlib? ( sys-libs/zlib:= )
	zstd? ( app-arch/zstd:= )
	X? ( x11-libs/gtk+:3 )"
RDEPEND="${DEPEND}
	!media-gfx/impack"
BDEPEND="sys-apps/help2man"

REQUIRED_USE="|| ( avif bmp flif heif jpegls jpeg2k jxr png tiff webp )"
S="${WORKDIR}/${MyP}"

impack_make() {
	tc-export CC AR RANLIB PKG_CONFIG
	emake CCFLAGS="${CFLAGS}" \
		WITH_NETTLE=$(usex crypt 1 0) \
		WITH_CHARLS=$(usex jpegls 1 0) \
		WITH_FLIF=$(usex flif 1 0) \
		WITH_JXRLIB=$(usex jxr 1 0) \
		WITH_LIBAVIF=$(usex avif 1 0) \
		WITH_LIBHEIF=$(usex heif 1 0) \
		WITH_LIBNSBMP=$(usex bmp 1 0) \
		WITH_LIBPNG=$(usex png 1 0) \
		WITH_LIBTIFF=$(usex tiff 1 0) \
		WITH_LIBWEBP=$(usex webp 1 0) \
		WITH_OPENJPEG2=$(usex jpeg2k 1 0) \
		WITH_BROTLI=$(usex brotli 1 0) \
		WITH_BZIP2=$(usex bzip2 1 0) \
		WITH_LZMA=$(usex lzma 1 0) \
		WITH_ZLIB=$(usex zlib 1 0) \
		WITH_ZSTD=$(usex zstd 1 0) \
		WITH_GTK=$(usex X 1 0) \
		$@
}

src_compile() {
	impack_make all
}

src_install() {
	dodir "/usr/bin" "/usr/share/man/man1"
	impack_make PREFIX="${ED}/usr" install
	dodoc README.md CHANGELOG
	use doc && dodoc doc/image-format-spec.txt
}

src_test() {
	impack_make check
}
