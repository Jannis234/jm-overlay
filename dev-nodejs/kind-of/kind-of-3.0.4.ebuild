# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="0.10.0"
NODE_MODULE_DEPEND="is-buffer:1.1.4"

inherit node-module

DESCRIPTION="Get the native type of a value"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
