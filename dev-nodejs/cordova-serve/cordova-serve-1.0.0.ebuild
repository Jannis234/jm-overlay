# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.12.0"
NODE_MODULE_EXTRA_FILES="serve.js src"
NODE_MODULE_DEPEND="q:1.4.1
	chalk:1.1.3
	compression:1.6.1
	express:4.13.4"

inherit node-module

DESCRIPTION="Apache Cordova server support for cordova-lib and cordova-browser"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md RELEASENOTES.md )
