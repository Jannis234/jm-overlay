# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_DEPEND="graceful-fs:4.1.11"

inherit node-module

DESCRIPTION="Easily read/write JSON files"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md CHANGELOG.md )
