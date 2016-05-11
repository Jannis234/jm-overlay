# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="jju:1.3.0"

inherit node-module

DESCRIPTION="A drop-in replacement for JSON.parse that uses jju to give helpful errors"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md )
