# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="combine-source-map:0.7.2
	concat-stream:1.5.2
	is-buffer:1.1.4
	JSONStream:1.2.1
	lexical-scope:1.2.0
	process:0.11.9
	through2:2.0.3
	xtend:4.0.1"

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
