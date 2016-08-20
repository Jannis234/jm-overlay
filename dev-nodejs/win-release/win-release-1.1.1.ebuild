# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.10.0"
NODE_MODULE_DEPEND="semver:5.1.0"

inherit node-module

DESCRIPTION="Get the name of a Windows version from the release number: 5.1.2600 -> XP"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.md )
