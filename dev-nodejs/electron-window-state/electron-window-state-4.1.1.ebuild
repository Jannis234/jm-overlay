# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_DEPEND="deep-equal:1.0.1
	jsonfile:2.4.0
	mkdirp:0.5.1"
NODEJS_MIN_VERSION="4"

inherit node-module

DESCRIPTION="Module that helps to save and restore size and position of Electron windows"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.md )
