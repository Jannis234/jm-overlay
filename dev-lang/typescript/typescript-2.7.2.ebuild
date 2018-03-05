# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="4.2.0"
NODE_MODULE_EXTRA_FILES="bin"

inherit node-module

SLOT="0"

DESCRIPTION="Language for application scale JavaScript development"
HOMEPAGE="http://www.typescriptlang.org/"

LICENSE="Apache-2.0 MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md AUTHORS.md CONTRIBUTING.md )

src_install() {
	rm lib/README.md || die
	node-module_src_install
	install_node_module_binary "bin/tsc" "/usr/bin/tsc"
	install_node_module_binary "bin/tsserver" "/usr/bin/tsserver"
}
