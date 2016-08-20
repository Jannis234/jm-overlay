# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.10"
NODE_MODULE_DEPEND="assert-plus:1.0.0"

inherit node-module

DESCRIPTION="A light, featureful and explicit option parsing library"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
