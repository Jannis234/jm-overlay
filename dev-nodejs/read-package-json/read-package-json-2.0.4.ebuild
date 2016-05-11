# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="read-json.js"
NODE_MODULE_DEPEND="graceful-fs:4.1.3
	json-parse-helpfulerror:1.0.3
	normalize-package-data:2.3.5
	glob:6.0.4"

inherit node-module

DESCRIPTION="The thing npm uses to read package.json files"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md )
