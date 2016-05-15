# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="graceful-fs:4.1.3
	mkdirp:0.5.1"

inherit node-module

DESCRIPTION="Used in npm for command line application support"

LICENSE="BSD-2"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md )
