# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="rules.js"

inherit node-module

DESCRIPTION="Declarative assertion framework for invocation ordering"

LICENSE="MIT Apache-2.0"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.markdown )
