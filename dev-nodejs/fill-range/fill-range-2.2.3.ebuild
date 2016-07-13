# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.10.0"
NODE_MODULE_DEPEND="repeat-element:1.1.2
	repeat-string:1.5.4
	isobject:2.1.0
	is-number:2.1.0
	randomatic:1.1.5"

inherit node-module

DESCRIPTION="Fill in a range of numbers or letters"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md )
