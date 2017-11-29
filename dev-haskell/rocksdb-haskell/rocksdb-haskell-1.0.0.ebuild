# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CABAL_FEATURES="lib test-suite"
inherit haskell-cabal

DESCRIPTION="Haskell bindings to RocksDB"
HOMEPAGE="https://github.com/serokell/rocksdb-haskell"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-haskell/binary:=
	dev-haskell/data-default:=
	>dev-haskell/resourcet-0.3.2:=
	dev-haskell/transformers:=
	>=dev-lang/ghc-8.0.1:=
	dev-db/rocksdb"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.10
	test? (
		dev-haskell/temporary
		>=dev-haskell/hspec-1.8
		dev-haskell/hspec-expectations
		dev-haskell/quickcheck:*
	)"
