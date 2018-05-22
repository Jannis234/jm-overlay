# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="4"
NODE_MODULE_DEPEND="ajv:5.5.2
	har-schema:2.0.0"

inherit node-module

DESCRIPTION="Extremely fast HTTP Archive (HAR) validator using JSON Schema"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
