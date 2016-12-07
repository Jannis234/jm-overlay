# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.9.9"
NODE_MODULE_EXTRA_FILES="src templates"
NODE_MODULE_DEPEND="aliasify:1.9.0
	cordova-common:1.5.1
	cordova-create:1.0.1
	cordova-fetch:1.0.1
	cordova-js:4.2.0
	cordova-registry-mapper:1.1.15
	cordova-serve:1.0.0
	dep-graph:1.1.0
	elementtree:0.1.6
	glob:5.0.15
	init-package-json:1.9.4
	nopt:3.0.6
	npm:2.15.11
	opener:1.4.1
	plist:1.2.0
	properties-parser:0.2.3
	q:1.0.1
	request:2.47.0
	semver:4.3.6
	shelljs:0.3.0
	tar:1.0.2
	underscore:1.7.0
	unorm:1.3.3
	valid-identifier:0.0.1
	xcode:0.8.9"

inherit node-module

DESCRIPTION="Apache Cordova tools core lib and API"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md RELEASENOTES.md )
