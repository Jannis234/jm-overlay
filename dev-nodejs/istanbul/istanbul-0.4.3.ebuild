# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="abbrev:1.0.9
	async:1.5.2
	wordwrap:1.0.0
	nopt:3.0.6
	esprima:2.7.2
	once:1.3.3
	supports-color:3.1.2
	which:1.2.10
	mkdirp:0.5.1
	fileset:0.2.1
	resolve:1.1.7
	escodegen:1.8.0
	js-yaml:3.6.1
	handlebars:4.0.5"

inherit node-module

DESCRIPTION="Yet another JS code coverage tool"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md CHANGELOG.md )
