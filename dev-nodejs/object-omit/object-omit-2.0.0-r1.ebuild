# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.10.0"
NODE_MODULE_NAME="object.omit"
NODE_MODULE_DEPEND="is-extendable:0.1.1
	for-own:0.1.4"

inherit node-module

DESCRIPTION="Return a copy of an object excluding the given key, or array of keys"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
