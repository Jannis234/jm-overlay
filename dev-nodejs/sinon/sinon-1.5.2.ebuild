# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_DEPEND="buster-format:0.5.6"
NODEJS_MIN_VERSION="0.1.103"

inherit node-module

DESCRIPTION="JavaScript test spies, stubs and mocks"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md AUTHORS )
