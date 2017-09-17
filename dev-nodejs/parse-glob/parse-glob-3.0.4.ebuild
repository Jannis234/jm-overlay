# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="0.10.0"
NODE_MODULE_DEPEND="is-extglob:1.0.0
	is-glob:2.0.1
	is-dotfile:1.0.2
	glob-base:0.3.0"

inherit node-module

DESCRIPTION="Parse a glob pattern into an object of tokens"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
