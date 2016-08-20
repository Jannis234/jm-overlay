# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.10"
NODE_MODULE_EXTRA_FILES="completion.sh.hbs locales"
NODE_MODULE_DEPEND="decamelize:1.2.0
	get-caller-file:1.0.2
	y18n:3.2.1
	which-module:1.0.0
	set-blocking:2.0.0
	window-size:0.2.0
	require-main-filename:1.0.1
	require-directory:2.1.1
	yargs-parser:2.4.1
	os-locale:1.4.0
	string-width:1.0.2
	cliui:3.2.0
	read-pkg-up:1.0.1"

inherit node-module

RDEPEND="${RDEPEND}
	dev-nodejs/lodash-assign:4.2.0"

DESCRIPTION="Yargs the modern, pirate-themed, successor to optimist"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

YARGS_L10N="de en es fr id it ja ko nb pirate pl pt_BR:pt-BR pt tr zh zh_CN:zh-CN"
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

src_install() {
	node-module_src_install
	install_node_module_depend "lodash.assign:4.2.0"
}
