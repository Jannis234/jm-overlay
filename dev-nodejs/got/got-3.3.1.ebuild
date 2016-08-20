# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.10.0"
NODE_MODULE_DEPEND="duplexify:3.4.3
	infinity-agent:2.0.3
	is-redirect:1.0.0
	is-stream:1.1.0
	lowercase-keys:1.0.0
	nested-error-stacks:1.0.2
	object-assign:3.0.0
	prepend-http:1.0.3
	read-all-stream:3.1.0
	timed-out:2.0.0"

inherit node-module

DESCRIPTION="Simplified HTTP/HTTPS requests"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.md )
