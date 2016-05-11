# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="semver:5.1.0
	hosted-git-info:2.1.4
	is-builtin-module:1.0.0
	validate-npm-package-license:3.0.1"

inherit node-module

DESCRIPTION="Normalizes data that can be found in package.json files"

LICENSE="BSD-2"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md AUTHORS )
