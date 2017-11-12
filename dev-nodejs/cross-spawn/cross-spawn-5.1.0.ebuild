# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_DEPEND="lru-cache:4.1.1
	which:1.3.0
	shebang-command:1.2.0"

inherit node-module

DESCRIPTION="Cross platform child_process#spawn and child_process#spawnSync"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md CHANGELOG.md )
