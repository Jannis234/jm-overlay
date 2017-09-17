# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_DEPEND="spdx-license-ids:1.2.1"

inherit node-module

DESCRIPTION="Correct invalid SPDX identifiers"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
