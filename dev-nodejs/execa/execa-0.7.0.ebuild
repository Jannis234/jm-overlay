# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_DEPEND="cross-spawn:5.1.0
	get-stream:3.0.0
	is-stream:1.1.0
	npm-run-path:2.0.2
	p-finally:1.0.0
	signal-exit:3.0.2
	strip-eof:1.0.0"
NODEJS_MIN_VERSION="4"

inherit node-module

DESCRIPTION="A better \"child_process\""

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.md )
