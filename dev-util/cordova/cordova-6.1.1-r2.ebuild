# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.9.9"
NODE_MODULE_EXTRA_FILES="bin src doc"
NODE_MODULE_DEPEND="underscore:1.7.0
	q:1.0.1
	ansi:0.3.1
	nopt:3.0.1
	update-notifier:0.5.0
	cordova-common:1.2.0
	cordova-lib:6.1.1"

inherit node-module bash-completion-r1

SLOT="0"

DESCRIPTION="Cordova command line interface tool"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
DOC_LANGS=( de es fr it ja ko pl ru zh )
IUSE="doc bash-completion l10n_en ${DOC_LANGS[@]/#/l10n_}"

DOCS=( README.md RELEASENOTES.md NOTICE CONTRIBUTING.md )

src_install() {
	rm bin/cordova.cmd || die # Only needed on windows

	for lang in ${DOC_LANGS[@]}; do
		use doc && use l10n_${lang} && dodoc -r doc/$lang
		rm -r doc/$lang || die
	done
	if use doc && use l10n_en; then
		docinto en
		dodoc doc/readme.md doc/bash.md
	fi
	rm doc/readme.md doc/bash.md || die

	node-module_src_install
	install_node_module_binary "bin/cordova" "/usr/bin/cordova"

	use bash-completion && newbashcomp "scripts/cordova.completion" "cordova"
}
