# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit eutils

MY_P="audacious-plugins-${PV}"
S="${WORKDIR}/${MY_P}"
DESCRIPTION="Patched version of audacious' LyricWiki plugin that works offline"
HOMEPAGE="http://audacious-media-player.org/ https://github.com/Jannis234/jm-overlay"
SRC_URI="!gtk3? ( http://distfiles.audacious-media-player.org/${MY_P}.tar.bz2 )
	 gtk3? ( http://distfiles.audacious-media-player.org/${MY_P}-gtk3.tar.bz2 )"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gtk gtk3 qt5"
REQUIRED_USE="^^ ( gtk gtk3 qt5 )"

RDEPEND=">=dev-libs/dbus-glib-0.60
	dev-libs/libxml2:2
	>=media-sound/audacious-${PV}
	gtk? ( x11-libs/gtk+:2
		   >=media-sound/audacious-${PV}[gtk?] )
	gtk3? ( x11-libs/gtk+:3
			>=media-sound/audacious-${PV}[gtk3?] )
	qt5? ( dev-qt/qtcore:5
		   dev-qt/qtgui:5
		   dev-qt/qtmultimedia:5
		   dev-qt/qtwidgets:5
		   >=media-sound/audacious-${PV}[qt5?] )"

DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_unpack() {
	default
	if use gtk3 ; then
		mv "${MY_P}-gtk3" "${MY_P}"
	fi
}

src_prepare() {
	eapply "${FILESDIR}/${PN}-3.7.1.patch"
	eapply_user
}

src_configure() {
	if use gtk ;then
		gtk="--enable-gtk"
	elif use gtk3 ;then
		gtk="--enable-gtk"
	else
		gtk="--disable-gtk"
	fi

	econf \
		--with-ffmpeg=none \
		${gtk} \
		--disable-notify \
		--disable-modplug \
		--disable-soxr \
		--disable-aac \
		--disable-alsa \
		--disable-bs2b \
		--disable-cdaudio \
		--disable-cue \
		--disable-flacng \
		--disable-amidiplug \
		--disable-filewriter_flac \
		--disable-neon \
		--disable-jack \
		--disable-gnomeshortcuts \
		--disable-filewriter_mp3 \
		--disable-resample \
		--disable-lirc \
		--disable-mms \
		--disable-mp3 \
		--disable-nls \
		--disable-pulse \
		--disable-scrobbler2 \
		--disable-sdlout \
		--disable-sid \
		--disable-sndfile \
		--disable-vorbis \
		--disable-wavpack \
		$(use_enable qt5 qt)
}

src_compile() {
	cd src || die
	emake $(usex qt5 lyricwiki-qt lyricwiki)
}

src_install() {
	insinto /usr/$(get_libdir)/audacious/General
	doins src/lyricwiki/$(usex qt5 lyricwiki-qt lyricwiki)-offline.so
}
