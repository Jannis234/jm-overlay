# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.12.0"
NODE_MODULE_DEPEND="dependency-ls:1.0.0
	q:1.4.1
	is-url:1.2.1
	shelljs:0.7.0
	cordova-common:1.3.0"

inherit node-module

DESCRIPTION="Apache Cordova fetch module. Fetches from git and npm."

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md RELEASENOTES.md )
