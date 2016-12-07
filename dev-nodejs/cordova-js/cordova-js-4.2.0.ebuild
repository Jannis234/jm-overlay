# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="tasks src"
NODE_MODULE_DEPEND="browserify:13.1.0"

inherit node-module

DESCRIPTION="A unified JavaScript layer for the Cordova suite of projects"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md CONTRIBUTING.md RELEASENOTES.md NOTICE )
