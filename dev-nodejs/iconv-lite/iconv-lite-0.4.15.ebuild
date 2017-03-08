# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.10.0"
NODE_MODULE_EXTRA_FILES="encodings"

inherit node-module

DESCRIPTION="Convert character encodings in pure javascript"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md Changelog.md )
