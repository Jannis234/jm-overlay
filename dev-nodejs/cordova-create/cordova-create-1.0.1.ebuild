# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.9.9"
NODE_MODULE_DEPEND="cordova-app-hello-world:3.11.0
	cordova-common:1.5.1
	cordova-fetch:1.0.1
	q:1.0.1
	shelljs:0.3.0
	valid-identifier:0.0.1"

inherit node-module

DESCRIPTION="Apache Cordova create module. Creates new project from default or template"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md RELEASENOTES.md )
