# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="abbrev:1.0.7
	ansi:0.3.1
	ansicolors:0.3.2
	ansi-regex:2.0.0
	ansistyles:0.1.3
	archy:1.0.0
	async-some:1.0.2
	block-stream:0.0.9
	char-spinner:1.0.1
	chmodr:1.0.2
	chownr:1.0.1
	cmd-shim:2.0.2
	columnify:1.5.4
	config-chain:1.1.10
	dezalgo:1.0.3
	editor:1.0.0
	fstream:1.0.9
	fstream-npm:1.0.7
	fs-vacuum:1.2.9
	fs-write-stream-atomic:1.0.8
	github-url-from-git:1.4.0
	github-url-from-username-repo:1.0.2
	glob:7.0.3
	graceful-fs:4.1.3
	hosted-git-info:2.1.4
	imurmurhash:0.1.4
	inflight:1.0.4
	inherits:2.0.1
	ini:1.3.4
	init-package-json:1.9.3
	lockfile:1.0.1
	lru-cache:4.0.1
	minimatch:3.0.0
	mkdirp:0.5.1
	nopt:3.0.6
	normalize-git-url:3.0.2
	normalize-package-data:2.3.5
	npm-cache-filename:1.0.2
	npm-install-checks:1.0.7
	npmlog:2.0.3
	npm-package-arg:4.1.1
	npm-registry-client:7.1.0
	npm-user-validate:0.1.2
	once:1.3.3
	opener:1.4.1
	osenv:0.1.3
	path-is-inside:1.0.1
	read:1.0.7
	readable-stream:2.1.2
	read-installed:4.0.3
	read-package-json:2.0.4
	realize-package-specifier:3.0.1
	request:2.72.0
	retry:0.9.0
	rimraf:2.5.2
	semver:5.1.0
	sha:2.0.1
	slide:1.1.6
	sorted-object:2.0.0
	spdx-license-ids:1.2.1
	strip-ansi:3.0.1
	tar:2.2.1
	text-table:0.2.0
	uid-number:0.0.6
	umask:1.1.0
	validate-npm-package-license:3.0.1
	validate-npm-package-name:2.2.2
	which:1.2.8
	wrappy:1.0.1
	write-file-atomic:1.1.4"

inherit node-module

DESCRIPTION="A package manager for JavaScript"

LICENSE="Artistic-2"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DOCS=( AUTHORS CHANGELOG.md CONTRIBUTING.md README.md )

src_prepare() {
	default
	rm -rf node_modules || die
}

src_compile() { :; }

src_install() {
	node-module_src_install
	use doc && dodoc -r doc/*
}
