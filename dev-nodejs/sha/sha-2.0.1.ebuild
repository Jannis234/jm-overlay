# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="readable-stream:2.1.2
	graceful-fs:4.1.3"

inherit node-module

DESCRIPTION="Check and get file hashes"

LICENSE="|| ( BSD-2 MIT )"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md )
