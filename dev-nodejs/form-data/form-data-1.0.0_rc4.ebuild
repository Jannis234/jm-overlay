# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="0.8"
NODE_MODULE_DEPEND="mime-types:2.1.10
	async:1.5.2
	combined-stream:1.0.5"

inherit node-module

MyPV="1.0.0-rc4"
SRC_URI="http://registry.npmjs.org/${PN}/-/${PN}-${MyPV}.tgz"
SLOT="${MyPV}"

DESCRIPTION="A module to create readable \"multipart/form-data\" streams"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
