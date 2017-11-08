# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_DEPEND="buster-core:0.6.4"

inherit node-module

DESCRIPTION="Tools for formatting JavaScript objects in a human-readable way"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"

DOCS=( AUTHORS Readme.md )
