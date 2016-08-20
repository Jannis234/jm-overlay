# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.10"
NODE_MODULE_DEPEND="pinkie-promise:2.0.1
	commander:2.9.0
	chalk:1.1.3
	is-my-json-valid:2.13.1"

inherit node-module

DESCRIPTION="Extremely fast HTTP Archive (HAR) validator using JSON Schema"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
