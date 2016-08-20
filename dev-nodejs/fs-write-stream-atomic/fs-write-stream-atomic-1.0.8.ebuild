# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="graceful-fs:4.1.3
	iferr:0.1.5
	imurmurhash:0.1.4
	readable-stream:2.1.2"

inherit node-module

DESCRIPTION="Like fs.createWriteStream(...), but atomic"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
