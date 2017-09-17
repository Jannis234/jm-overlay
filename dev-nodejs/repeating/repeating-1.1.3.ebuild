# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_DEPEND="is-finite:1.0.1"

NODEJS_MIN_VERSION="0.10.0"

inherit node-module

DESCRIPTION="Repeat a string - fast"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.md )
