# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 readme.gentoo-r1 eutils

DESCRIPTION="Upload files to onedrive via linux command line"
HOMEPAGE="https://github.com/fkalis/bash-onedrive-upload"
EGIT_REPO_URI="https://github.com/fkalis/bash-onedrive-upload.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="app-shells/bash
	net-misc/curl[ssl]
	sys-apps/grep"

src_prepare() {
	eapply "${FILESDIR}/${PN}-system-wide.patch"
	eapply_user
}

src_install() {
	dodoc README.md
	rm README.md LICENSE libs/json/LICENSE libs/json/README.md libs/json/example.json || die
	insinto "/usr/$(get_libdir)/${PN}"
	doins -r *
	for i in onedrive-authorize onedrive-upload onedriveb-authorize onedriveb-upload; do
		fperms +x "/usr/$(get_libdir)/${PN}/$i"
		make_wrapper $i "${EROOT}usr/$(get_libdir)/${PN}/$i" "${EROOT}usr/$(get_libdir)/${PN}/"
	done
	fperms +x "/usr/$(get_libdir)/${PN}/libs/json/bash-json-parser"
	readme.gentoo_create_doc
}

pkg_postinst() {
	readme.gentoo_print_elog
}
