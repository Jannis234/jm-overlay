# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_DEPEND="isexe:2.0.0"

inherit node-module

DESCRIPTION="Like which(1) unix command. Find the first instance of an executable in the PATH"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md CHANGELOG.md )
