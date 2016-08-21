# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.9.9"
NODE_MODULE_EXTRA_FILES="src"
NODE_MODULE_DEPEND="cordova-registry-mapper:1.1.15
	unorm:1.4.1
	underscore:1.8.3
	q:1.4.1
	semver:5.3.0
	ansi:0.3.1
	osenv:0.1.3
	bplist-parser:0.1.1
	glob:5.0.15
	minimatch:3.0.3
	shelljs:0.5.3
	elementtree:0.1.6
	plist:1.2.0"

inherit node-module

DESCRIPTION="Apache Cordova tools and platforms shared routines"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md RELEASENOTES.md )
