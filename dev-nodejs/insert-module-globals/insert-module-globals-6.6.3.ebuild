# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="process:0.11.3
	is-buffer:1.1.3
	xtend:4.0.1
	concat-stream:1.4.10
	through2:1.1.1
	JSONStream:1.1.1
	combine-source-map:0.6.1
	lexical-scope:1.2.0"

inherit node-module

DESCRIPTION="Insert implicit module globals into a module-deps stream"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DOCS=( readme.markdown )

src_install() {
	node-module_src_install
	use examples && dodoc -r example
}
