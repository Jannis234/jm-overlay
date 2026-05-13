# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	lazy_static@1.4.0
	libc@0.2.82
"

inherit cargo

DESCRIPTION="A utility for mapping events from Linux event devices"
HOMEPAGE="https://github.com/KarsMulder/evsieve"
SRC_URI="
	https://github.com/KarsMulder/evsieve/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="GPL-2 MIT"
# Dependent crate licenses
LICENSE+=" || ( Apache-2.0 MIT )"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-libs/libevdev"
RDEPEND="${DEPEND}"
BDEPEND="dev-util/bindgen"

src_prepare() {
	# Argument was renamed in current versions of bindgen
	sed -i "s|whitelist|allowlist|g" generate_bindings.sh || die
	sed -i "s|/usr|${EPREFIX}/usr|g" generate_bindings.sh || die
	default
}

src_compile() {
	./generate_bindings.sh || die
	cargo_src_compile
}
