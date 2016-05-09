# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.8.0"
NODE_MODULE_DEPEND="escape-html:1.0.3
	parseurl:1.3.1
	send:0.13.1"

inherit node-module

DESCRIPTION="Serve static files"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md HISTORY.md )
