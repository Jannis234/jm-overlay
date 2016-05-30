# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.11.0"
NODE_MODULE_EXTRA_FILES="src global.js make.js shell.js"
NODE_MODULE_DEPEND="interpret:1.0.1
	glob:7.0.3
	rechoir:0.6.2"

inherit node-module

DESCRIPTION="Portable Unix shell commands for Node.js"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="${RDEPEND}"
DOCS=( README.md MAINTAINERS )

src_compile() {
	# Docs are already included in README.md
	# regenerate them to make sure they're up-to-date
	mkdir node_modules || die
	for p in ${NODE_MODULE_DEPEND}; do
		local version="${p#*:}"
		local name="${p%:*}"
		ln -s /usr/$(get_libdir)/node/${name}/${version} ./node_modules/${name} || die
	done
	./scripts/generate-docs.js || die
}
