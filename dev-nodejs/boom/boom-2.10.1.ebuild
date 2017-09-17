# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="0.10.40"
NODE_MODULE_DEPEND="hoek:2.16.3"

inherit node-module

DESCRIPTION="HTTP-friendly error objects"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md CONTRIBUTING.md )
