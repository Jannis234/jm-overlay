# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="semver:5.1.0"
NODEJS_MIN_VERSION="0.10.0"

inherit node-module

DESCRIPTION="Get the diff type of two semver versions"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.md )
