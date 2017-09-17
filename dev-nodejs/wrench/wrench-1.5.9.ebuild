# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="0.1.97"

inherit node-module

DESCRIPTION="Recursive filesystem (and other) operations that Node *should* have"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.md )

pkg_postinst() {
	ewarn "Note that this package is deprecated and developers should migrate to fs-extra"
}
