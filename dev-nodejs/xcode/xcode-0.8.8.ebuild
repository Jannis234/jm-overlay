# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.6.7"
NODE_MODULE_DEPEND="node-uuid:1.4.7
	simple-plist:0.1.4"

inherit node-module

DEPEND="dev-util/pegjs"

DESCRIPTION="Parser for xcodeproj/project.pbxproj files"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md AUTHORS )

src_compile() {
	emake parser
}
