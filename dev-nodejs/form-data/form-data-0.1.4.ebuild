# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.8"
NODE_MODULE_DEPEND="mime:1.2.11
	async:0.9.2
	combined-stream:0.0.7"

inherit node-module

DESCRIPTION="A module to create readable \"multipart/form-data\" streams"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( Readme.md )
