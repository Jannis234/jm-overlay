# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="signal-exit:3.0.0
	cross-spawn:4.0.0"

inherit node-module

DESCRIPTION="Run a child as if it's the foreground process. Give it stdio. Exit when it exits"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md CHANGELOG.md )
