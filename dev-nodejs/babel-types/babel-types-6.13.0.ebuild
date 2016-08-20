# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="to-fast-properties:1.0.2
	esutils:2.0.2
	lodash:4.15.0
	babel-runtime:6.11.6"

inherit node-module

DESCRIPTION="Methods for building ASTs manually and for checking the types of AST nodes"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

# Cyclic dependency
PDEPEND="dev-nodejs/babel-traverse:6.13.0"

DOCS=( README.md )

src_install() {
	node-module_src_install
	# babel-traverse is in PDEPEND, so we might have to install symlink that is broken
	# until portage installs babel-traverse (install_node_module_depend would fail here)
	dosym "${EROOT}usr/$(get_libdir)/node/babel-traverse/6.13.0" "/usr/$(get_libdir)/node/${NODE_MODULE_NAME}/${SLOT}/node_modules/babel-traverse"
}
