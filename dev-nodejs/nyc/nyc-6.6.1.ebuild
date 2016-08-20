# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="bin"
NODE_MODULE_DEPEND="append-transform:0.4.0
	arrify:1.0.1
	caching-transform:1.0.1
	convert-source-map:1.2.0
	default-require-extensions:1.0.0
	find-cache-dir:0.1.1
	find-up:1.1.2
	foreground-child:1.5.1
	glob:7.0.3
	istanbul:0.4.3
	md5-hex:1.3.0
	micromatch:2.3.8
	mkdirp:0.5.1
	pkg-up:1.0.0
	resolve-from:2.0.0
	rimraf:2.5.2
	signal-exit:3.0.0
	source-map:0.5.6
	spawn-wrap:1.2.3
	test-exclude:1.1.0
	yargs:4.7.1"

inherit node-module

DESCRIPTION="A code coverage tool that works well with subprocesses"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md CHANGELOG.md )

src_prepare() {
	eapply_user

	rm -r node_modules || die
}
