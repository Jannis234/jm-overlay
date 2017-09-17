# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_DEPEND="esprima:1.0.4"
NODE_MODULE_EXTRA_FILES="index_browser.js"
NODEJS_MIN_VERSION="0.6.0"

inherit node-module

DESCRIPTION="YAML 1.2 parser and serializer"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DOCS=( README.md HISTORY.md )

src_install() {
	node-module_src_install

	use examples && dodoc -r examples
}
