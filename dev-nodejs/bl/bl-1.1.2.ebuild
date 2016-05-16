# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="readable-stream:2.0.6"

inherit node-module

DESCRIPTION="Buffer List: Collect buffers, access with a standard readable Buffer interface"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md )
