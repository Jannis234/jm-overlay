# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="0.10.0"
NODE_MODULE_DEPEND="pify:2.3.0
	graceful-fs:4.1.4
	pinkie-promise:2.0.1"

inherit node-module

DESCRIPTION="Check if a path is a file, directory, or symlink"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.md )
