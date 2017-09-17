# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="0.10.0"
NODE_MODULE_DEPEND="path-exists:2.1.0
	pinkie-promise:2.0.1"

inherit node-module

DESCRIPTION="Find a file by walking up parent directories"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.md )
