# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="lru.js"

inherit node-module

DESCRIPTION="Signs and prepares requests using AWS Signature Version 4"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
