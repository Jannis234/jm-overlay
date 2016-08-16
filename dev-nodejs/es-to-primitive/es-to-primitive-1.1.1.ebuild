# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.4"
NODE_MODULE_EXTRA_FILES="es5.js es6.js helpers"
NODE_MODULE_DEPEND="is-date-object:1.0.1
	is-callable:1.1.3
	is-symbol:1.0.1"

inherit node-module

DESCRIPTION="ECMAScript ToPrimitive algorithm. Provides ES5 and ES6 versions."

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md CHANGELOG.md )

src_compile() { :; }
