# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="taffy.js"

inherit node-module git-r3

DESCRIPTION="An open-source library that brings database features into your applications"

EGIT_REPO_URI="https://github.com/hegemonic/taffydb.git"
EGIT_COMMIT="7d100bcee0e997ee4977e273cdce60bd8933050e"
SRC_URI=""
S="${WORKDIR}/${P}"

LICENSE="BSD-1"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md )
