# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="0.8"
NODE_MODULE_DEPEND="assert-plus:0.2.0
	jsprim:1.2.2
	sshpk:1.8.3"

inherit node-module

DESCRIPTION="Reference implementation of Joyent's HTTP Signature scheme"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DOCS=( README.md CHANGES.md )

src_install() {
	node-module_src_install
	use doc && dodoc http_signing.md
}
