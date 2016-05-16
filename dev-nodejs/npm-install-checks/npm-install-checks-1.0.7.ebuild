# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="semver:5.1.0
	npmlog:2.0.3"

inherit node-module

DESCRIPTION="Checks that npm runs during the installation of a module"

LICENSE="BSD-2"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md )
