# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.8.0"
NODE_MODULE_DEPEND="escape-html:1.0.3
	destroy:1.0.4
	range-parser:1.0.3
	fresh:0.3.0
	statuses:1.2.1
	etag:1.7.0
	ms:0.7.1
	mime:1.3.4
	depd:1.1.0
	debug:2.2.0
	http-errors:1.3.1
	on-finished:2.3.0"

inherit node-module

DESCRIPTION="Better streaming static file server with Range and conditional-GET support"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md HISTORY.md )
