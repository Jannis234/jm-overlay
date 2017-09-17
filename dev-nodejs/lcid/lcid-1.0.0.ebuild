# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="0.10.0"
NODE_MODULE_EXTRA_FILES="${PN}.json"
NODE_MODULE_DEPEND="invert-kv:1.0.0"

inherit node-module

DESCRIPTION="Mapping between standard locale identifiers and Windows locale identifiers"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.md )
