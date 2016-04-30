# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.10.0"
NODE_MODULE_EXTRA_FILES="check.js"
NODE_MODULE_DEPEND="chalk:1.1.3
	configstore:1.4.0
	is-npm:1.0.0
	latest-version:1.0.1
	repeating:1.1.3
	semver-diff:2.1.0
	string-length:1.0.1"

inherit node-module

DESCRIPTION="Update notifications for your CLI app"

LICENSE="BSD-2"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( readme.md )
