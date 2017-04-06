# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3 flag-o-matic linux-info

DESCRIPTION="MacOS translation layer for Linux"
HOMEPAGE="https://www.darlinghq.org/"
EGIT_REPO_URI="https://github.com/darlinghq/darling.git"

LICENSE="GPL-3 GPL-2 BSD BSD-2 BSD-4 Apache-2.0 PSF-2 MIT LGPL-2.1 APSL-2 Info-ZIP openssl ZLIB public-domain"
SLOT="0"
KEYWORDS="-* ~amd64"
IUSE=""

# Incompatible licenses from all the bundled components
RESTRICT="bindist"

CONFIG_CHECK="~OVERLAY_FS"

CDEPEND="virtual/libudev
	sys-fs/fuse"
DEPEND="${CDEPEND}
	>=dev-util/cmake-2.8
	sys-devel/clang
	sys-devel/bison
	sys-devel/flex"
RDEPEND="${CDEPEND}
	~app-emulation/darling-mach-lkm-${PV}"

src_prepare() {
	# Building darling can take forever, so avoid rebuilding the entire thing after
	# every kernel update by splitting the kernel module into its own ebuild
	eapply "${FILESDIR}/darling-split-lkm.patch"
	# Don't do this in src_install (sandbox violation) allow the script to be installed
	eapply "${FILESDIR}/darling-setup-ld-so.patch"
	eapply_user
}

src_configure() {
	export CC=clang
	export CXX=clang++
	strip-unsupported-flags

	local cmakeargs=(
		-DCMAKE_INSTALL_PREFIX="${EPREFIX}/usr"
	)

	mkdir -p build || die
	cd build || die
	cmake .. -DCMAKE_TOOLCHAIN_FILE=../Toolchain.cmake $cmakeargs || die
}

src_compile() {
	cd build || die
	emake VERBOSE=1
}

src_install() {
	export PORTAGE_INSTDIR="${ED}"

	cd build || die
	DESTDIR="${D}" emake install

	sed -i "s|exit|cd ${EROOT}usr/libexec/darling|g" ../src/setup-ld-so.sh || die
	newsbin ../src/setup-ld-so.sh darling-ldconfig

	dodoc ../README.md
	newinitd "${FILESDIR}/darling-binfmt-r1.initd" "darling-binfmt"
}

pkg_postinst() {
	darling-ldconfig || die

	elog "Darling maintains its own ld.so.conf and ld.so.cache"
	elog "If you have problems because darling can't find some libraries,"
	elog "try running \"darling-ldonfig\" as root"
}

pkg_prerm() {
	# Delete files created during pkg_postinst
	rm -f "${EROOT}usr/libexec/darling/etc/ld.so.cache"
	rm -f "${EROOT}usr/libexec/darling/etc/ld.so.conf"
	rm -rf "${EROOT}usr/libexec/darling/etc/ld.so.conf.d"
}
