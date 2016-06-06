# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python3_{4,5} )

inherit distutils-r1 elisp-common

DESCRIPTION="The Meson Build System"
HOMEPAGE="http://mesonbuild.com/"
SRC_URI="https://github.com/mesonbuild/meson/releases/download/${PV}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="emacs"

RDEPEND="dev-util/ninja
	emacs? ( virtual/emacs )
	${PYTHON_DEPS}"
DEPEND="${PYTHON_DEPS}"

src_compile() {
	distutils-r1_src_compile
	use emacs && elisp-compile data/meson.el
}

src_install() {
	distutils-r1_src_install
	dodoc authors.txt contributing.txt
	for i in mesonconf mesonintrospect meson; do
		dosym "${EROOT}usr/bin/${i}.py" "/usr/bin/${i}"
	done

	use emacs && elisp-install "${PN}" data/meson.el*
}

pkg_postinst() {
	use emacs && elisp-site-regen
}

pkg_postrm() {
	use emacs && elisp-site-regen
}
