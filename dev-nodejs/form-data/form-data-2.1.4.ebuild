# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="0.12"
NODE_MODULE_DEPEND="mime-types:2.1.17
	asynckit:0.4.0
	combined-stream:1.0.5"

inherit node-module

DESCRIPTION="A module to create readable \"multipart/form-data\" streams"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
