# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_4 python3_5 python3_6 )

inherit toolchain-funcs python-r1 java-pkg-opt-2

DESCRIPTION="Command line argument parser library, like getopt, except better"
HOMEPAGE="https://github.com/maandree/argparser"
SRC_URI="https://github.com/maandree/argparser/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc python java"

RDEPEND="python? ( ${PYTHON_DEPS} )
	java? ( >=virtual/jre-1.6:* )"
DEPEND="${RDEPEND}
	doc? ( sys-apps/texinfo )
	java? ( >=virtual/jdk-1.6:* )"

src_prepare() {
	sed -i "/-O6/d" Makefile || die
	sed -i "s/C_OPTIMISE/CFLAGS/g" Makefile || die
	sed -i "/LIBPY3 =/d" Makefile || die
	eapply_user
}

src_compile() {
	tc-export CC
	emake c C_OPTIMISE="${CFLAGS}"
	use doc && emake doc
	use python && emake python
	use java && emake java
}

src_install() {
	export DESTDIR="${D}"
	dodoc README

	emake install-c LIBC="${EPREFIX}/usr/$(get_libdir)"
	use doc && emake install-doc
	use java && java-pkg_dojar bin/ArgParser.jar

	if use python; then
		do_install_python() {
			python_export PYTHON_SITEDIR
			export LIBPY3="${PYTHON_SITEDIR}"
			emake install-python
		}
		python_foreach_impl do_install_python
	fi
}
