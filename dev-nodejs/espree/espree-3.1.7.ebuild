# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="0.10.0"
NODE_MODULE_DEPEND="acorn:3.3.0
	acorn-jsx:3.0.1"

inherit node-module

DESCRIPTION="An actively-maintained fork of Esprima"

LICENSE="BSD-2"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md CHANGELOG.md )
