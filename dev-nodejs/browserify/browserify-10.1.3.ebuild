# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="https-browserify:0.0.1
	http-browserify:1.7.0
	path-browserify:0.0.0
	constants-browserify:0.0.1
	tty-browserify:0.0.0
	os-browserify:0.1.2
	stream-browserify:1.0.0
	timers-browserify:1.4.2
	vm-browserify:0.0.4
	console-browserify:1.1.0
	crypto-browserify:3.11.0
	browserify-zlib:0.1.4
	punycode:1.4.1
	builtins:0.0.7
	browser-resolve:1.11.1
	isarray:0.0.1
	string_decoder:0.10.31
	through2:1.1.1
	inherits:2.0.1
	process:0.11.3
	htmlescape:1.1.1
	commondir:0.0.1
	assert:1.3.0
	shell-quote:0.0.1
	duplexer2:0.0.2
	defined:1.0.0
	domain-browser:1.1.7
	xtend:4.0.1
	shallow-copy:0.0.1
	deep-equal:1.0.1
	querystring-es3:0.2.1
	deps-sort:1.3.9
	util:0.10.3
	concat-stream:1.4.10
	events:1.0.2
	parents:1.0.1
	has:1.0.1
	read-only-stream:1.1.1
	readable-stream:1.1.14
	url:0.10.3
	subarg:1.0.0
	shasum:1.0.2
	buffer:3.6.0
	glob:4.5.3
	JSONStream:1.1.1
	labeled-stream-splicer:1.0.2
	syntax-error:1.1.6
	resolve:1.1.7
	module-deps:3.9.1
	browser-pack:4.0.4
	insert-module-globals:6.6.3"

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
