# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_EXTRA_FILES="array boolean date error function global.js iterable math number object reg-exp string"

inherit node-module

DESCRIPTION="ECMAScript extensions and shims"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

# Break cyclic dependencies
PDEPEND="dev-nodejs/es6-symbol:3.1.0
	dev-nodejs/es6-iterator:2.0.0"

DOCS=( README.md CHANGES )

src_install() {
	node-module_src_install
	# Because of cyclic dependencies, these may not be installed yet,
	# so we need to install symlinks that are broken until they are installed
	dosym "${EROOT}usr/$(get_libdir)/node/es6-symbol/3.1.0" "/usr/$(get_libdir)/node/${NODE_MODULE_NAME}/${SLOT}/node_modules/es6-symbol"
	dosym "${EROOT}usr/$(get_libdir)/node/es6-iterator/2.0.0" "/usr/$(get_libdir)/node/${NODE_MODULE_NAME}/${SLOT}/node_modules/es6-iterator"
}
