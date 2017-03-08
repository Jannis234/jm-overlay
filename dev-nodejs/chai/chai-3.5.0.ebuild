# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.4.0"
NODE_MODULE_DEPEND="assertion-error:1.0.2
	deep-eql:0.1.3
	type-detect:1.0.0"

inherit node-module

DESCRIPTION="BDD/TDD assertion library for node.js and the browser"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md History.md ReleaseNotes.md CONTRIBUTING.md )
