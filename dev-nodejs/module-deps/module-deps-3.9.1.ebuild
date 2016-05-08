# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.6"
NODE_MODULE_DEPEND="browser-resolve:1.11.1
	through2:1.1.1
	inherits:2.0.1
	defined:1.0.0
	duplexer2:0.0.2
	xtend:4.0.1
	concat-stream:1.4.10
	parents:1.0.1
	readable-stream:1.1.14
	subarg:1.0.0
	stream-combiner2:1.0.2
	JSONStream:1.1.1
	resolve:1.1.7
	detective:4.3.1"

inherit node-module

DESCRIPTION="Walk the dependency graph to generate json output"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DOCS=( readme.markdown )

src_install() {
	node-module_src_install
	use examples && dodoc -r example
}
