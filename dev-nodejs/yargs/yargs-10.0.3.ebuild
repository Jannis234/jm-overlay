# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="4"
NODE_MODULE_EXTRA_FILES="completion.sh.hbs locales"
NODE_MODULE_DEPEND="cliui:3.2.0
	decamelize:1.2.0
	find-up:2.1.0
	get-caller-file:1.0.2
	os-locale:2.1.0
	require-directory:2.1.1
	require-main-filename:1.0.1
	set-blocking:2.0.0
	string-width:2.1.1
	which-module:2.0.0
	y18n:3.2.1
	yargs-parser:8.0.0"

inherit node-module

DESCRIPTION="Yargs the modern, pirate-themed, successor to optimist"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

YARGS_L10N="be de en es fr hi hu id it ja ko nb nl pirate pl pt_BR:pt-BR pt ru th tr zh_CN:zh-CN zh_TW:zh-TW"
for l in $YARGS_L10N; do
	IUSE+=" l10n_${l#*:}"
done

DOCS=( README.md CHANGELOG.md )

src_prepare() {
	eapply_user
	for l in $YARGS_L10N; do
		if ! use l10n_${l#*:}; then
			rm locales/${l%:*}.json || die
		fi
	done
}
