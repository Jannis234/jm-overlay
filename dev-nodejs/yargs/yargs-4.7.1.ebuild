# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.10"
NODE_MODULE_EXTRA_FILES="completion.sh.hbs locales"
NODE_MODULE_DEPEND="decamelize:1.2.0
	camelcase:3.0.0
	y18n:3.2.1
	set-blocking:1.0.0
	window-size:0.2.0
	require-main-filename:1.0.1
	yargs-parser:2.4.0
	os-locale:1.4.0
	string-width:1.0.1
	cliui:3.2.0
	pkg-conf:1.1.3
	read-pkg-up:1.0.1"

inherit node-module

RDEPEND="${RDEPEND}
	dev-nodejs/lodash-assign:4.0.9"

DESCRIPTION="Yargs the modern, pirate-themed, successor to optimist"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

IUSE=""
YARGS_L10N="de en es fr id it ja ko nb pirate pl pt_BR:pt-BR pt tr zh"
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
	install_node_module_depend "lodash.assign:4.0.9"
}
