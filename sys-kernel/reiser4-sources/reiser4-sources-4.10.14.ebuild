# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

ETYPE="sources"
K_WANT_GENPATCHES="base extras experimental"
K_GENPATCHES_VER="15"
K_SECURITY_UNSUPPORTED="1"
REISER4_VER="4.10.0"

inherit kernel-2
detect_version
detect_arch

KEYWORDS="~amd64 ~x86"
HOMEPAGE="https://dev.gentoo.org/~mpagano/genpatches http://sourceforge.net/projects/reiser4/"
IUSE="experimental"

DESCRIPTION="Full sources including the Gentoo and Reiser4 patchsets for the ${KV_MAJOR}.${KV_MINOR} kernel tree"
REISER4_URI="http://downloads.sourceforge.net/project/reiser4/reiser4-for-linux-4.x/reiser4-for-${REISER4_VER}.patch.gz"
GENPATCHES_URI="https://dev.gentoo.org/~mpagano/genpatches/tarballs/genpatches-${KV_MAJOR}.${KV_MINOR}-${K_GENPATCHES_VER}.base.tar.xz
	https://dev.gentoo.org/~mpagano/genpatches/tarballs/genpatches-${KV_MAJOR}.${KV_MINOR}-${K_GENPATCHES_VER}.extras.tar.xz
	https://dev.gentoo.org/~mpagano/genpatches/tarballs/genpatches-${KV_MAJOR}.${KV_MINOR}-${K_GENPATCHES_VER}.experimental.tar.xz"
SRC_URI="${KERNEL_URI} ${GENPATCHES_URI} ${ARCH_URI} ${REISER4_URI}"

UNIPATCH_LIST="${UNIPATCH_LIST} ../reiser4-for-${REISER4_VER}.patch"

src_unpack() {
	unpack reiser4-for-${REISER4_VER}.patch.gz
	kernel-2_src_unpack
}

pkg_postinst() {
	kernel-2_pkg_postinst
}

pkg_postrm() {
	kernel-2_pkg_postrm
}
