# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="0.6.0"

inherit node-module

DESCRIPTION="Extended POSIX-style sprintf"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md CHANGES.md CONTRIBUTING.md )

src_compile() { :; }
