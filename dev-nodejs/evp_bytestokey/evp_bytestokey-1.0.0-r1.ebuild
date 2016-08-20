# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="create-hash:1.1.2"

inherit node-module

DESCRIPTION="The super secure key derivation algorithm from openssl"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.md )
