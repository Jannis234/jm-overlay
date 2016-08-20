# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.4.0"
NODE_MODULE_DEPEND="sax:0.3.5"

inherit node-module

DESCRIPTION="XML Serialization and Parsing module based on Python's ElementTree"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md CHANGES.md )

src_compile() { :; }
