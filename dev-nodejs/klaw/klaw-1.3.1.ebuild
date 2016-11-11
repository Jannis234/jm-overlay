# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="src"
NODE_MODULE_DEPEND="graceful-fs:4.1.10"

inherit node-module

DESCRIPTION="File system walker with Readable stream interface"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md CHANGELOG.md )
