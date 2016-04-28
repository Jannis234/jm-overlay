# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="imurmurhash:0.1.4
	slide:1.1.6"

inherit node-module

DESCRIPTION="Write files in an atomic fashion w/configurable ownership"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md )
