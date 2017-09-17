# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

DESCRIPTION="Cross-platform Amiga emulator"
HOMEPAGE="http://fs-uae.net/"
SRC_URI="https://fs-uae.net/stable/${PV}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="media-libs/libsdl2[video]
	media-libs/openal
	media-libs/libpng:0
	dev-libs/glib:2
	sys-libs/zlib
	x11-libs/libX11
	media-libs/libmpeg2
	virtual/opengl
	virtual/libintl"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	app-arch/zip
	sys-devel/gettext"
