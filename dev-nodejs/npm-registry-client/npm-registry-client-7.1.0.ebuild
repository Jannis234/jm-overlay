# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="chownr:1.0.1
	graceful-fs:4.1.3
	slide:1.1.6
	retry:0.8.0
	semver:5.1.0
	once:1.3.3
	npm-package-arg:4.1.1
	mkdirp:0.5.1
	concat-stream:1.5.1
	rimraf:2.5.2
	normalize-package-data:2.3.5
	npmlog:2.0.3
	request:2.72.0"

inherit node-module

DESCRIPTION="Client for the npm registry"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
