# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs multilib-minimal

REL_ZIP_NAME="ca3cd964-fb11-4f79-a100-d1755e2dee20"

DESCRIPTION="Open source implementation of the jpegxr image format standard"
HOMEPAGE="https://archive.codeplex.com/?p=jxrlib"
SRC_URI="https://codeplexarchive.blob.core.windows.net/archive/projects/jxrlib/jxrlib.zip"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="static-libs doc"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="app-arch/unzip"

S="${WORKDIR}/sourceCode/${PN}"

src_unpack() {
	# unzip exits with a warning (return value 1) because of windows-style path separators in the archive
	unzip "${DISTDIR}/${PN}.zip"
	[ $? -ne 0 -a $? -ne 1 ] && die "unzip failed"
}

src_prepare() {
	sed -i "s/-O/\$\{OPT\}/" Makefile || die # Respect custom CFLAGS
	sed -i "/install \$(DIR_BUILD)\/\$(ENCAPP)/d" Makefile || die # Don't always install applications (for multilib)
	sed -i "s/\$(DIR_INSTALL)\/lib/\$(DIR_INSTALL)\/\$(LIBDIR)/g" Makefile || die # LIBDIR setting for multilib
	sed -i "/install -m 644 doc/d" Makefile || die # Don't always install docs
	sed -i "s/\$(DIR_INSTALL)\/share\/doc\/jxr-\$(JXR_VERSION)//" Makefile || die # Don't install an empty doc directory
	sed -i "s/ranlib/$(tc-getRANLIB)/g" Makefile || die # Use correct ranlib when cross-compiling
	eapply_user
	multilib_copy_sources
}

multilib_src_compile() {
	endian=""
	if [ "$(tc-endian)" == "big" ]; then
		endian="1"
	fi
	emake SHARED=1 BIG_ENDIAN="${endian}" CC="$(tc-getCC)" OPT="${CFLAGS}"
	use static-libs && emake BIG_ENDIAN="${endian}" CC="$(tc-getCC)" OPT="${CFLAGS}"
}

multilib_src_install() {
	emake SHARED=1 DIR_INSTALL="${ED}/usr" LIBDIR="$(get_libdir)" install
	use static-libs && emake DIR_INSTALL="${ED}/usr" LIBDIR="$(get_libdir)" install
	multilib_is_native_abi && dobin build/JxrDecApp build/JxrEncApp
}

multilib_src_install_all() {
	use doc && dodoc "doc/JPEGXR_DPK_Spec_1.0.doc"
}
