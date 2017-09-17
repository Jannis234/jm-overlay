# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_DEPEND="handlebars:4.0.5"

inherit node-module

SLOT="1.0.0-alpha.8"
SRC_URI="http://registry.npmjs.org/${PN}/-/${PN}-${SLOT}.tgz"

DESCRIPTION="Istanbul reports"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
