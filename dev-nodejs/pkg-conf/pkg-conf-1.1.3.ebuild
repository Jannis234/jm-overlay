# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.10.0"
NODE_MODULE_DEPEND="object-assign:4.1.0
	symbol:0.2.3
	find-up:1.1.2
	load-json-file:1.1.0"

inherit node-module

DESCRIPTION="Get namespaced config from the closest package.json"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( readme.md )
