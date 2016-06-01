# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="bplistCreator.js"
NODE_MODULE_DEPEND="stream-buffers:0.2.6"

inherit node-module

DESCRIPTION="Binary Mac OS X Plist (property list) creator"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md )
