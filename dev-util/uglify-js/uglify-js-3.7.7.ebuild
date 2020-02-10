# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

NODE_DEPEND="commander:2.20.3
	source-map:0.6.1"
NODE_BIN="uglifyjs:bin/uglifyjs"
NODEJS_MIN_VERSION="0.10.0"

inherit node

DESCRIPTION="JavaScript parser, mangler/compressor and beautifier toolkit"
HOMEPAGE="https://github.com/mishoo/UglifyJS2"

LICENSE="BSD-2 BSD MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
