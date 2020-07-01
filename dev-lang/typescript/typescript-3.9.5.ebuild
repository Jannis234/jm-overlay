# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

NODE_BIN="tsc:bin/tsc
	tsserver:bin/tsserver"
NODEJS_MIN_VERSION="4.2.0"

inherit node

DESCRIPTION="TypeScript is a language for application scale JavaScript development"
HOMEPAGE="https://www.typescriptlang.org/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
