# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.4"
NODE_MODULE_DEPEND="es5-ext:0.9.2"

inherit node-module

DESCRIPTION="Cross-environment event emitter"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md CHANGES )

src_compile() { :; }
