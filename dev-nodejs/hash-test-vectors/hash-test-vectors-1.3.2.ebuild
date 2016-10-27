# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="index.json check-pbkdf2.js hmac.json hmac-vectors.js key-data.json pbkdf2.json vectors.js vectors"

inherit node-module

DESCRIPTION="Test vectors for hashes"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

src_install() {
	newdoc vectors/Readme.txt Readme_vectors.txt
	rm vectors/Readme.txt || die
	node-module_src_install
	dodoc README.md
	use doc && dodoc rfc4231.txt rfc6070.txt
}
