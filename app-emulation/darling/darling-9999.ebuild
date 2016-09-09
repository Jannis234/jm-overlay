# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3 flag-o-matic linux-mod udev user

DESCRIPTION="MacOS translation layer for Linux"
HOMEPAGE="https://www.darlinghq.org/"
EGIT_REPO_URI="https://github.com/darlinghq/darling.git"

LICENSE="GPL-3 GPL-2 BSD BSD-2 BSD-4 Apache-2.0 PSF-2 MIT LGPL-2.1 APSL-2 Info-ZIP openssl ZLIB public-domain"
SLOT="0"
KEYWORDS="-* ~amd64"
IUSE="32bit framework-coreaudio framework-appkit pulseaudio alsa"

# Incompatible licenses from all the bundled components
RESTRICT="bindist"

REQUIRED_USE="pulseaudio? ( framework-coreaudio )
	alsa? ( framework-coreaudio )
	framework-coreaudio? ( || ( alsa pulseaudio ) )"
RDEPEND="virtual/udev
	virtual/libudev
	sys-fs/fuse
	framework-coreaudio? (
		alsa? ( media-libs/alsa-lib )
		pulseaudio? ( media-sound/pulseaudio )
	)
	32bit? (
		virtual/libudev[abi_x86_32]
		framework-coreaudio? (
			alsa? ( media-libs/alsa-lib[abi_x86_32] )
			pulseaudio? ( media-sound/pulseaudio[abi_x86_32] )
		)
	)"
DEPEND="${RDEPEND}
	>=dev-util/cmake-2.8
	sys-devel/clang
	sys-devel/bison
	sys-devel/flex
	virtual/linux-sources"

MODULE_NAMES="darling-mach(misc:${S}/src/lkm)"
BUILD_TARGETS="default"

src_configure() {
	export CC=clang
	export CXX=clang++
	strip-unsupported-flags

	local cmakeargs=(
		-DCMAKE_INSTALL_PREFIX="${EPREFIX}/usr"
		-DFRAMEWORK_COREAUDIO=$(usex framework-coreaudio ON OFF)
		-DFRAMEWORK_APPKIT=$(usex framework-appkit ON OFF)
		-DENABLE_ALSA=$(usex alsa ON OFF)
		-DENABLE_PULSEAUDIO=$(usex pulseaudio ON OFF)
	)

	mkdir -p build/x86_64 || die
	cd build/x86_64 || die
	einfo "Configuring for x86_64"
	cmake ../.. -DCMAKE_TOOLCHAIN_FILE=../../Toolchain-x86_64.cmake $cmakeargs || die

	if use 32bit; then
		mkdir -p ../i386 || die
		cd ../i386 || die
		einfo "Configuring for i386"
		cmake ../.. -DCMAKE_TOOLCHAIN_FILE=../../Toolchain-x86.cmake $cmakeargs || die
	fi
}

src_compile() {
	cd build/x86_64 || die
	einfo "Building for x86_64"
	emake

	if use 32bit; then
		cd ../i386 || die
		einfo "Building for i386"
		emake
	fi

	linux-mod_src_compile
}

src_install() {
	cd build/x86_64 || die
	DESTDIR="${D}" emake install

	if use 32bit; then
		cd ../i386 || die
		DESTDIR="${D}" emake install
	fi

	dodoc ../../README.md
	udev_dorules "${FILESDIR}/99-darling-mach.rules"
	newinitd "${FILESDIR}/darling-binfmt-r1.initd" "darling-binfmt"

	linux-mod_src_install
}

pkg_postinst() {
	enewgroup darling

	ewarn "To use darling, you have to add yourself to the \"darling\" group"
	ewarn "and load the \"darling-mach\" kernel module"
	ewarn ""
	ewarn "Note that the kernel module is likely to have stability/security problems!"
	ewarn "Only add trusted users to the \"darling\" group!"
}
