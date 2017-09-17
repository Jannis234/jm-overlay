# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="0.10.0"
NODE_MODULE_DEPEND="kind-of:3.0.3"

inherit node-module

DESCRIPTION="Returns true if the value is a number"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
