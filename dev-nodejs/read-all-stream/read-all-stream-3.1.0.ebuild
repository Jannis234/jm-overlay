# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.10.0"
NODE_MODULE_DEPEND="pinkie-promise:2.0.1
	readable-stream:2.1.2"

inherit node-module

DESCRIPTION="Read all stream content and pass it to callback"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( readme.md )
