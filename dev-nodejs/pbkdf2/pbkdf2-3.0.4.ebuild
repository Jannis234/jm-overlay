# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="async-shim.js browser.js"
NODE_MODULE_DEPEND="create-hmac:1.1.4"

inherit node-module

DESCRIPTION="Provides the functionality of PBKDF2"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md )
