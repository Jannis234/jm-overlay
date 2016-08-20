# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.9.9"
NODE_MODULE_EXTRA_FILES="src templates"
NODE_MODULE_DEPEND="aliasify:1.9.0
	ansi:0.3.1
	balanced-match:0.3.0
	base64-js:0.0.8
	big-integer:1.6.12
	bplist-parser:0.1.1
	brace-expansion:1.1.3
	concat-map:0.0.1
	cordova-app-hello-world:3.10.0
	cordova-common:1.1.1
	cordova-js:4.1.4
	cordova-registry-mapper:1.1.15
	cordova-serve:1.0.0
	dep-graph:1.1.0
	elementtree:0.1.6
	glob:5.0.15
	inflight:1.0.4
	inherits:2.0.1
	init-package-json:1.9.3
	lodash:3.10.1
	minimatch:3.0.0
	nopt:3.0.6
	npm:2.15.4
	once:1.3.3
	opener:1.4.1
	osenv:0.1.3
	os-homedir:1.0.1
	os-tmpdir:1.0.1
	path-is-absolute:1.0.0
	plist:1.2.0
	properties-parser:0.2.3
	q:1.0.1
	request:2.47.0
	sax:0.3.5
	semver:4.3.6
	shelljs:0.3.0
	tar:1.0.2
	underscore:1.7.0
	unorm:1.3.3
	util-deprecate:1.0.2
	valid-identifier:0.0.1
	wrappy:1.0.1
	xcode:0.8.0
	xmlbuilder:4.0.0
	xmldom:0.1.22"

inherit node-module

DESCRIPTION="Apache Cordova tools core lib and API"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md RELEASENOTES.md )

src_prepare() {
	default
	rm -rf node_modules || die
}
