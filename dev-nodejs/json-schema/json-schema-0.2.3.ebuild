# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_EXTRA_FILES="draft-00 draft-01 draft-02 draft-03 draft-04"

inherit node-module

DESCRIPTION="JSON Schema validation and specifications"

LICENSE="|| ( BSD AFL-2.1 )"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
