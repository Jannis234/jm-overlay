# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.4"
NODE_MODULE_EXTRA_FILES="decode.js encode.js"

inherit node-module

DESCRIPTION="Node's querystring module for all engines. (ES3 compat fork)"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( Readme.md History.md )
