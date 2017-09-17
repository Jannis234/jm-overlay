# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="0.10.0"
NODE_MODULE_EXTRA_FILES="js.js json.js"
NODE_MODULE_DEPEND="strip-bom:2.0.0"

inherit node-module

DESCRIPTION="Node's default require extensions as a separate module"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.md )
