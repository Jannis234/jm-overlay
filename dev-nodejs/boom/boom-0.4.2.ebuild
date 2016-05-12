# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.8.0"
NODE_MODULE_DEPEND="hoek:0.9.1"

inherit node-module

DESCRIPTION="HTTP-friendly error objects"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md )

src_compile() { :; }
