# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.11.0"
NODE_MODULE_EXTRA_FILES="src global.js make.js shell.js plugin.js"
NODE_MODULE_DEPEND="interpret:1.0.1
	glob:7.0.5
	rechoir:0.6.2"

inherit node-module

DESCRIPTION="Portable Unix shell commands for Node.js"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"

DEPEND="${RDEPEND}"
DOCS=( README.md MAINTAINERS CHANGELOG.md )

src_compile() {
	# Docs are already included in README.md
	# regenerate them to make sure they're up-to-date
	for p in ${NODE_MODULE_DEPEND}; do
		install_node_module_build_depend "$p"
	done
	./scripts/generate-docs.js || die
}
