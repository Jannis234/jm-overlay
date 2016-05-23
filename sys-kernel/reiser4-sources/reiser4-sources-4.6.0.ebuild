# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

ETYPE="sources"
K_WANT_GENPATCHES="base extras experimental"
K_GENPATCHES_VER="1"
K_DEBLOB_AVAILABLE="1"
K_KDBUS_AVAILABLE="0"
K_SECURITY_UNSUPPORTED="1"

inherit kernel-2
detect_version
detect_arch

KEYWORDS="~alpha ~amd64 ~arm ~arm64 -hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
HOMEPAGE="https://dev.gentoo.org/~mpagano/genpatches http://sourceforge.net/projects/reiser4/"
IUSE="deblob experimental"

DESCRIPTION="Full sources including the Gentoo and Reiser4 patchsets for the ${KV_MAJOR}.${KV_MINOR} kernel tree"
REISER4_URI="http://downloads.sourceforge.net/project/reiser4/reiser4-for-linux-4.x/reiser4-for-${PV}.patch.gz"
SRC_URI="${KERNEL_URI} ${GENPATCHES_URI} ${ARCH_URI} ${REISER4_URI}"

UNIPATCH_LIST="${UNIPATCH_LIST} ../reiser4-for-${PV}.patch"

src_unpack() {
	unpack reiser4-for-${PV}.patch.gz
	kernel-2_src_unpack
}

pkg_postinst() {
	kernel-2_pkg_postinst
}

pkg_postrm() {
	kernel-2_pkg_postrm
}
