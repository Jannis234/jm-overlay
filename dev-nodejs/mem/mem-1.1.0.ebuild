# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_DEPEND="mimic-fn:1.1.0"
NODEJS_MIN_VERSION="4"

inherit node-module

DESCRIPTION="Memoize functions"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.md )
