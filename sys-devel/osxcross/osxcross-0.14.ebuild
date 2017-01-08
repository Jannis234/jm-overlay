# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3 check-reqs flag-o-matic

XCODE_VER="7.3.1"
XCODE_URI="Xcode_${XCODE_VER}.dmg"

DESCRIPTION="OS X cross toolchain"
HOMEPAGE="https://github.com/tpoechtrager/osxcross"
SRC_URI="${XCODE_URI}"
EGIT_REPO_URI="https://github.com/tpoechtrager/osxcross.git"

LICENSE="GPL-2 APSL-2.0 Xcode"
SLOT="0"
KEYWORDS="~amd64"
IUSE="macports"

CHECKREQS_DISK_BUILD="10G"
EGIT_COMMMIT="a9317c18a3a457ca0a657f08cc4d0d43c6cf8953"
RESTRICT="mirror bindist"

# We don't need a "libressl" USE flag because MacPorts just uses the "openssl" binary, the library isn't needed
CDEPEND=">=sys-devel/clang-3.2
	app-arch/xar"
RDEPEND="${CDEPEND}
	macports? (
		app-shells/bash
		net-misc/wget
		|| ( dev-libs/openssl:0 dev-libs/libressl )
	)"
DEPEND="${CDEPEND}
	app-shells/bash
	app-arch/p7zip
	app-arch/xz-utils"

pkg_nofetch() {
	einfo "Please download ${XCODE_URI} from"
	einfo "https://developer.apple.com/download/more/"
	einfo "(this requires an apple account)"
	einfo "and move the file to ${DISTDIR}"
}

src_unpack() {
	git-r3_src_unpack

	mkdir -p "${WORKDIR}/xcode" || die
	cd "${WORKDIR}/xcode" || die
	7z x "${DISTDIR}/${XCODE_URI}" 5.hfs || die
	7z x 5.hfs "*/Xcode*.app/Contents/Developer/Platforms/MacOSX.platform" "*/Xcode*.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain" || die
	rm 5.hfs || die # Free about 8GB that we don't need anymore

	# 7zip fails to extract symlinks from HFS+ images and creates text files containing the link's destination
	# To fix this, I'm using a pre-generated list of symlinks and re-create the links here
	# This is a bit ugly, but it's better than having to mount the image at build time
	cd Xcode || die
	for i in $(cat "${FILESDIR}/xcode-${XCODE_VER}-symlinks.xz" | xz -d); do
		linkdest="$(cat $i)"
		rm $i || die
		ln -s "$linkdest" $i || die
	done
}

src_prepare() {
	sed -i "s/\/tmp/\$TMPD/g" tools/gen_sdk_package.sh
	eapply_user
}

src_compile() {
	cd tarballs || die
	export CC=clang
	export CXX=clang++
	strip-unsupported-flags
	TMPD="${T}" XCODEDIR="${WORKDIR}/xcode/Xcode" ../tools/gen_sdk_package.sh || die
	cd .. || die

	UNATTENDED=1 ./build.sh || die
}

src_install() {
	dodoc AUTHORS CHANGELOG KNOWN_BUGS.md README.md TODO
	rm target/bin/omp target/bin/osxcross-macports target/bin/osxcross-mp || die
	insinto "/opt/${PN}"
	doins -r target/*
	doenvd "${FILESDIR}/99osxcross"
	cd target || die
	for i in bin/* libexec/as/*/as SDK/MacOSX*.sdk/usr/bin/*; do
		fperms +x "/opt/${PN}/$i"
	done
	cd .. || die

	if use macports; then
		dodoc README.MACPORTS.md
		insinto "/opt/${PN}/bin"
		doins tools/osxcross-macports
		fperms +x "/opt/${PN}/bin/osxcross-macports"
		for i in omp osxcross-mp; do
			dosym osxcross-macports "/opt/${PN}/bin/$i"
		done
		doenvd "${FILESDIR}/99osxcross-macports"
	fi
}

pkg_postinst() {
	ewarn "Please run env-update && source /etc/profile"
	ewarn "or restart the current session to have the toolchain"
	ewarn "added to your PATH"
}
