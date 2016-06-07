# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="mute-stream:0.0.5
	code-point-at:1.0.0
	is-fullwidth-code-point:1.0.0"

inherit node-module

DESCRIPTION="Readline Façade fixing bugs and issues found in releases 0.8 and 0.10"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md )
