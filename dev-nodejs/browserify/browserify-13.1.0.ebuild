# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="assert:1.3.0
	browser-pack:6.0.2
	browser-resolve:1.11.2
	browserify-zlib:0.1.4
	buffer:4.9.1
	concat-stream:1.5.2
	console-browserify:1.1.0
	constants-browserify:3.11.0
	crypto-browserify:3.11.0
	defined:1.0.0
	deps-sort:2.0.0
	domain-browser:1.1.7
	duplexer2:0.1.4
	events:1.1.1
	glob:5.0.15
	has:1.0.1
	htmlescape:1.1.1
	https-browserify:0.0.1
	inherits:2.0.3
	insert-module-globals:7.0.1
	JSONStream:1.2.1
	labeled-stream-splicer:2.0.0
	module-deps:4.0.8
	os-browserify:0.1.2
	parents:1.0.1
	path-browserify:0.0.0
	process:0.11.9
	punycode:1.4.1
	querystring-es3:0.2.1
	read-only-stream:2.0.0
	readable-stream:2.2.2
	resolve:1.1.7
	shasum:1.0.2
	shell-quote:1.6.1
	stream-browserify:2.0.1
	stream-http:2.5.0
	string_decoder:0.10.31
	subarg:1.0.0
	syntax-error:1.1.6
	through2:2.0.3
	timers-browserify:1.4.2
	tty-browserify:0.0.0
	url:0.11.0
	util:0.10.3
	vm-browserify:0.0.4
	xtend:4.0.1"

inherit node-module

DESCRIPTION="Browser-side require() the node way"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DOCS=( readme.markdown changelog.markdown )

src_install() {
	node-module_src_install
	use examples && dodoc -r example
}
