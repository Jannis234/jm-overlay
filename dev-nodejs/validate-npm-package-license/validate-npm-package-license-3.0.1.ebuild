# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="spdx-correct:1.0.2
	spdx-expression-parse:1.0.2"

inherit node-module

DESCRIPTION="Give me a string and I'll tell you if it's a valid npm package license string"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md )
