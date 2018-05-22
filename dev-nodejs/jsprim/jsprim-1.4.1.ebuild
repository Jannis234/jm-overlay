# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="0.6.0"
NODE_MODULE_DEPEND="extsprintf:1.3.0
	verror:1.10.0
	json-schema:0.2.3
	assert-plus:1.0.0"

inherit node-module

DESCRIPTION="Utilities for primitive JavaScript types"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md CHANGES.md CONTRIBUTING.md )
