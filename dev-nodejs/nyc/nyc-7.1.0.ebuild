# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="bin"
NODE_MODULE_DEPEND="arrify:1.0.1
	caching-transform:1.0.1
	convert-source-map:1.3.0
	default-require-extensions:1.0.0
	find-cache-dir:0.1.1
	find-up:1.1.2
	foreground-child:1.5.3
	glob:7.0.5
	istanbul-lib-coverage:1.0.0
	istanbul-lib-hook:1.0.0-alpha.4
	istanbul-lib-instrument:1.1.0
	istanbul-lib-report:1.0.0-alpha.3
	istanbul-lib-source-maps:1.0.0-alpha.10
	istanbul-reports:1.0.0-alpha.8
	md5-hex:1.3.0
	micromatch:2.3.11
	mkdirp:0.5.1
	pkg-up:1.0.0
	resolve-from:2.0.0
	rimraf:2.5.4
	signal-exit:3.0.0
	spawn-wrap:1.2.4
	test-exclude:1.1.0
	yargs:4.8.1
	yargs-parser:2.4.1"

inherit node-module

DESCRIPTION="The Istanbul command line interface"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md CHANGELOG.md )

src_prepare() {
	eapply_user
	rm -r node_modules || die
}
