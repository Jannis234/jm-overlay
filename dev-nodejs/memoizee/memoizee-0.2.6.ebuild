# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.4"
NODE_MODULE_DEPEND="es5-ext:0.9.2
	event-emitter:0.2.2
	next-tick:0.1.0"

inherit node-module

DESCRIPTION="Complete memoize/cache solution"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md CHANGES )

src_compile() { :; }
