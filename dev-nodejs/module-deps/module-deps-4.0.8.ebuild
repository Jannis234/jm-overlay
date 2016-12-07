# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.6"
NODE_MODULE_DEPEND="browser-resolve:1.11.2
	cached-path-relative:1.0.0
	concat-stream:1.5.2
	defined:1.0.0
	detective:4.3.2
	duplexer2:0.1.4
	inherits:2.0.3
	JSONStream:1.2.1
	parents:1.0.1
	readable-stream:2.2.2
	resolve:1.1.7
	stream-combiner2:1.1.1
	subarg:1.0.0
	through2:2.0.3
	xtend:4.0.1"

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
