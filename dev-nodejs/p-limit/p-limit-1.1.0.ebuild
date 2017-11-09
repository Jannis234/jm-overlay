# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="4"

inherit node-module

DESCRIPTION="Run multiple promise-returning & async functions with limited concurrency"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.md )
