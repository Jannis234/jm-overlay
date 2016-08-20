# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.10.0"
NODE_MODULE_DEPEND="exit-hook:1.1.1
	onetime:1.1.0"

inherit node-module

DESCRIPTION="Gracefully restore the CLI cursor on exit"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.md )
