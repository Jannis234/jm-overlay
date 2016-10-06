# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.4"
NODE_MODULE_EXTRA_FILES="implementation.js polyfill.js shim.js"
NODE_MODULE_DEPEND="define-properties:1.1.2"

inherit node-module

DESCRIPTION="ES6-compliant shim for Number.isNaN - the global isNaN returns false positives"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md CHANGELOG.md )
