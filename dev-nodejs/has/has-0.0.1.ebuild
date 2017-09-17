# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="0.8.0"
NODE_MODULE_EXTRA_FILES="src"

inherit node-module

DESCRIPTION="Object.prototype.hasOwnProperty.call shortcut"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

RESTRICT="test" # Broken
DOCS=( README.mkd )
