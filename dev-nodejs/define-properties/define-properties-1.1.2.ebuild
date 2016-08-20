# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.4"
NODE_MODULE_DEPEND="foreach:2.0.5
	object-keys:1.0.11"

inherit node-module

DESCRIPTION="Define multiple non-enumerable properties at once"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md CHANGELOG.md )
