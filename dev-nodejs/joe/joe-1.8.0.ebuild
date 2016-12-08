# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.12"
NODE_MODULE_EXTRA_FILES="es2015 source"
NODE_MODULE_DEPEND="editions:1.3.3
	event-emitter-grouped:2.5.0
	taskgroup:5.0.1"

inherit node-module

DESCRIPTION="Joe is a JavaScript testing framework that actually works"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md HISTORY.md )
