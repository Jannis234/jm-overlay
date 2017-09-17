# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="0.10.0"
NODE_MODULE_DEPEND="is-fullwidth-code-point:1.0.0
	code-point-at:1.0.0
	strip-ansi:3.0.1"

inherit node-module

DESCRIPTION="Get the visual width of a string"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.md )
