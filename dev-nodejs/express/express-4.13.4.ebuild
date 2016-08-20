# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.10.0"
NODE_MODULE_DEPEND="escape-html:1.0.3
	array-flatten:1.1.1
	cookie-signature:1.0.6
	content-type:1.0.1
	vary:1.0.1
	merge-descriptors:1.0.1
	methods:1.1.2
	etag:1.7.0
	serve-static:1.10.2
	cookie:0.1.5
	range-parser:1.0.3
	parseurl:1.3.1
	content-disposition:0.5.1
	fresh:0.3.0
	utils-merge:1.0.0
	path-to-regexp:0.1.7
	depd:1.1.0
	qs:4.0.0
	on-finished:2.3.0
	finalhandler:0.4.1
	debug:2.2.0
	type-is:1.6.12
	send:0.13.1
	accepts:1.2.13
	proxy-addr:1.0.10"

inherit node-module

DESCRIPTION="Fast, unopinionated, minimalist web framework"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( Readme.md History.md )
