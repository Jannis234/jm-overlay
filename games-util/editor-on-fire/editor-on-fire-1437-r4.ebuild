# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit games toolchain-funcs

MyPV=r${PV}
MyP=${PN}-${MyPV}

DESCRIPTION="Song editor for Frets On Fire, Phase Shift, Rock Band and Rocksmith"
HOMEPAGE="https://github.com/raynebc/editor-on-fire"
SRC_URI="https://github.com/raynebc/${PN}/archive/${MyPV}.tar.gz -> ${MyP}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc examples mp3"

DEPEND="media-libs/allegro:0"
RDEPEND="${DEPEND}
	mp3? (
		media-sound/lame
		media-sound/vorbis-tools
	)"

S="${WORKDIR}/${MyP}"

src_prepare() {
	find -type f -exec chmod -x {} \; || die

	sed -i \
		-e "s/-O2 -fomit-frame-pointer -ffast-math -funroll-loops/\$(CUSTOM_CFLAGS)/" \
		src/makefile.linux || die

	# No need to check for lame and oggenc at every startup since that was already done by the package manager
	epatch "${FILESDIR}"/eof_no_lame_oggenc_check.patch || die
	# oggCat is currently not available in portage
	epatch "${FILESDIR}"/eof_no_oggcat_check.patch || die
	# EOF assumes its directory to be writable in some cases which doesn't work on system-wide installs
	# (unless you're on windows, of course)
	epatch "${FILESDIR}"/eof_log_file_location.patch || die
	epatch "${FILESDIR}"/eof_temp_files_location.patch || die

	epatch_user
}

src_compile() {
	emake CUSTOM_CFLAGS="${CFLAGS}" CC="$(tc-getCC)"
}

src_install() {
	local dir=${GAMES_PREFIX_OPT}/${PN}

	insinto ${dir}
	doins -r ./bin/*
	chmod +x "${D}"/${dir}/eof || die

	games_make_wrapper ${PN} ${dir}/eof ${dir}
	make_desktop_entry ${PN} "Editor on fire" ${dir}/EOF20.ico

	dodoc ideas.txt todo.txt bin/history.txt bin/readme.txt bin/keys.txt
	use doc && dodoc customhopo.txt "EOF proposed project format.txt" "Guitar Pro 5.10 format.txt"

	cd "${D}"/${dir}
	use examples && dodoc -r "Example Song"
	use doc && dodoc -r manual proguitartutorial tutorial vocaltutorial
	rm GPL_license.txt history.txt keys.txt license.txt mp3toogg.bat readme.txt || die
	rm -r "Example Song" proguitartutorial tutorial vocaltutorial manual || die
}
