# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_DEPEND="js-tokens:2.0.0
	esutils:2.0.2
	chalk:1.1.3
	babel-runtime:6.11.6"

inherit node-module

DESCRIPTION="Generate errors that contain a code frame that point to source locations"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
