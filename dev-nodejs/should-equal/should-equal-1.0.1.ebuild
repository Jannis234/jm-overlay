# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="cjs es6"
NODE_MODULE_DEPEND="should-type:1.4.0"

inherit node-module

DESCRIPTION="Deep comparison of 2 instances for should.js"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
