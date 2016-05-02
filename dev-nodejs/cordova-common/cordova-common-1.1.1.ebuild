# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.9.9"
NODE_MODULE_EXTRA_FILES="src"
NODE_MODULE_DEPEND="q:1.4.1
	semver:5.1.0
	shelljs:0.5.3
	underscore:1.8.3"

inherit node-module

DESCRIPTION="Apache Cordova tools and platforms shared routines"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md RELEASENOTES.md )
