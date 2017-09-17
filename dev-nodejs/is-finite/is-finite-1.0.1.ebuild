# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_DEPEND="number-is-nan:1.0.0"

NODEJS_MIN_VERSION="0.10.0"

inherit node-module

DESCRIPTION="ES6 Number.isFinite() ponyfill"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.md )
