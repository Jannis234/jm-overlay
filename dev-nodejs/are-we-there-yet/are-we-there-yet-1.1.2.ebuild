# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="tracker-base.js tracker-group.js tracker.js tracker-stream.js"
NODE_MODULE_DEPEND="delegates:1.0.0
	readable-stream:2.1.2"

inherit node-module

DESCRIPTION="Keep track of the overall completion of many dispirate processes"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md CHANGES.md )
