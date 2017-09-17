# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_EXTRA_FILES="fp"

inherit node-module

DESCRIPTION="Lodash modular utilities"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )

src_install() {
	node-module_src_install
	insinto "/usr/$(get_libdir)/node/${NODE_MODULE_NAME}/${SLOT}"
	doins *.js # Too many files to list them all in NODE_MODULE_EXTRA_FILES
}
