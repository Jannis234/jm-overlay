# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="0.10.0"
NODE_MODULE_DEPEND="is-utf8:0.2.1"

inherit node-module

DESCRIPTION="Strip UTF-8 byte order mark (BOM) from a string/buffer"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.md )
