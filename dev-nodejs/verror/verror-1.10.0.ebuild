# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="0.6.0"
NODE_MODULE_DEPEND="extsprintf:1.4.0
	core-util-is:1.0.2
	assert-plus:1.0.0"

inherit node-module

DESCRIPTION="Richer JavaScript errors"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md CHANGES.md CONTRIBUTING.md )
