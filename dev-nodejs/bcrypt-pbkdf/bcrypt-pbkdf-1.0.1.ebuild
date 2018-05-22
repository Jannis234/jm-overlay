# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_DEPEND="tweetnacl:0.14.5"

inherit node-module

DESCRIPTION="Port of the OpenBSD bcrypt_pbkdf function to pure JS"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
