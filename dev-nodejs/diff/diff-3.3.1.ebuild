# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_EXTRA_FILES="runtime.js dist"
NODEJS_MIN_VERSION="0.3.1"

inherit node-module

DESCRIPTION="A javascript text diff implementation"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"

DOCS=( CONTRIBUTING.md README.md release-notes.md )
