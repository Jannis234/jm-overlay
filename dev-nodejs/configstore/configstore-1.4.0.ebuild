# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.10.0"
NODE_MODULE_DEPEND="graceful-fs:4.1.3
	mkdirp:0.5.1
	object-assign:4.0.1
	osenv:0.1.3
	os-tmpdir:1.0.1
	uuid:2.0.2
	write-file-atomic:1.1.4
	xdg-basedir:2.0.0"

inherit node-module

DESCRIPTION="Easily load and save config without having to think about where and how"

LICENSE="BSD-2"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( readme.md )
