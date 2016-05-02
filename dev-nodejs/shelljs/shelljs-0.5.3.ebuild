# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.8.0"
NODE_MODULE_EXTRA_FILES="global.js make.js shell.js"

inherit node-module

DESCRIPTION="Portable Unix shell commands for Node.js"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=net-libs/nodejs-${NODEJS_MIN_VERSION}"
DOCS=( README.md )

src_compile() {
	# Docs are already included in README.md
	# regenerate them to make sure they're up-to-date
	./scripts/generate-docs.js || die
}
