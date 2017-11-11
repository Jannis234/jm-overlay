# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_DEPEND="arrify:1.0.1
	micromatch:2.3.11
	object-assign:4.1.1
	read-pkg-up:1.0.1
	require-main-filename:1.0.1"

inherit node-module

DESCRIPTION="Test for inclusion or exclusion of paths using pkg-conf and globs"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md CHANGELOG.md )
