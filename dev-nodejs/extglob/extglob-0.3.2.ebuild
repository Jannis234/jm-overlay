# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.10.0"
NODE_MODULE_DEPEND="is-extglob:1.0.0"

inherit node-module

DESCRIPTION="Convert extended globs to regex-compatible strings"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
