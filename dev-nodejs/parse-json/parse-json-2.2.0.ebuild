# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.10.0"
NODE_MODULE_EXTRA_FILES="vendor"
NODE_MODULE_DEPEND="error-ex:1.3.0"

inherit node-module

DESCRIPTION="Parse JSON with more helpful errors"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.md )
