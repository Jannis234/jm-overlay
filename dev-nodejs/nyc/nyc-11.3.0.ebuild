# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_EXTRA_FILES="bin"
NODE_MODULE_DEPEND="archy:1.0.0
	arrify:1.0.1
	caching-transform:1.0.1
	convert-source-map:1.5.0
	debug-log:1.0.1
	default-require-extensions:1.0.0
	find-cache-dir:0.1.1
	find-up:2.1.0
	foreground-child:1.5.6
	glob:7.1.2
	istanbul-lib-coverage:1.1.1
	istanbul-lib-hook:1.1.0
	istanbul-lib-instrument:1.9.1
	istanbul-lib-report:1.1.2
	istanbul-lib-source-maps:1.2.2
	istanbul-reports:1.1.3
	md5-hex:1.3.0
	merge-source-map:1.0.4
	micromatch:2.3.11
	mkdirp:0.5.1
	resolve-from:2.0.0
	rimraf:2.6.2
	signal-exit:3.0.2
	spawn-wrap:1.3.8
	test-exclude:4.1.1
	yargs:10.0.3
	yargs-parser:8.0.0"

inherit node-module

DESCRIPTION="The Istanbul command line interface"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md CHANGELOG.md )

src_prepare() {
	eapply_user
	rm -r node_modules || die
}
