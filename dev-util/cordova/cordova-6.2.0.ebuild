# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.9.9"
NODE_MODULE_EXTRA_FILES="bin src doc"
NODE_MODULE_DEPEND="underscore:1.7.0
	q:1.0.1
	nopt:3.0.1
	update-notifier:0.5.0
	cordova-common:1.3.0
	cordova-lib:6.2.0
	insight:0.8.2"

inherit node-module bash-completion-r1

SLOT="0"

DESCRIPTION="Cordova command line interface tool"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
DOC_LINGUAS=( de es fr it ja ko pl ru zh )
IUSE="doc bash-completion linguas_en ${DOC_LINGUAS[@]/#/linguas_}"

DOCS=( README.md RELEASENOTES.md NOTICE CONTRIBUTING.md )

src_install() {
	rm bin/cordova.cmd || die # Only needed on windows

	for lang in ${DOC_LINGUAS}; do
		use doc && dodoc -r doc/$lang
		rm -r doc/$lang || die
	done
	if use doc && use linguas_en; then
		docinto en
		dodoc doc/readme.md doc/bash.md
	fi
	rm doc/readme.md doc/bash.md || die

	node-module_src_install
	install_node_module_binary "bin/cordova" "/usr/bin/cordova"

	use bash-completion && newbashcomp "scripts/cordova.completion" "cordova"
}
