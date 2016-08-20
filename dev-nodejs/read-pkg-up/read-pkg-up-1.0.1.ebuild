# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.10.0"
NODE_MODULE_DEPEND="find-up:1.1.2
	read-pkg:1.1.0"

inherit node-module

DESCRIPTION="Read the closest package.json file"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.md )
