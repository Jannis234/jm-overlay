# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="0.6.0"
NODE_MODULE_DEPEND="extsprintf:1.0.2"

inherit node-module

DESCRIPTION="Richer JavaScript errors"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DOCS=( README.md )

src_compile() { :; }

src_install() {
	node-module_src_install
	use examples && dodoc -r examples
}
