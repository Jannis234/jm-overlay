# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.12"
NODE_MODULE_EXTRA_FILES="es2015 source"
NODE_MODULE_DEPEND="ambi:2.5.0
	eachr:3.2.0
	editions:1.3.3
	extendr:3.2.2"

inherit node-module

DESCRIPTION="Group together synchronous and asynchronous tasks"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md HISTORY.md )
