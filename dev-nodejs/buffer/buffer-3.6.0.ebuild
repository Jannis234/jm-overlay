# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="base64-js:0.0.8
	ieee754:1.1.6
	isarray:1.0.0"

inherit node-module

DESCRIPTION="Node.js Buffer API, for the browser"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
