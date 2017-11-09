# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_DEPEND="p-locate:2.0.0
	path-exists:3.0.0"
NODEJS_MIN_VERSION="4"

inherit node-module

DESCRIPTION="Get the first path that exists on disk of multiple paths"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.md )
