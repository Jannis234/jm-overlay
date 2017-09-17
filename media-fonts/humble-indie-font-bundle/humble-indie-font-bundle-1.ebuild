# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit font

DESCRIPTION="Font pack released by humble bundle as April Fools"
HOMEPAGE="https://www.humblebundle.com/store/indiefonts-bundle-freegame"
SRC_URI="after-impact? ( afterimpact.zip )
	bike-courier? ( bikecourier.zip )
	cosmic-sans? ( cosmicsans.zip )
	halfvetica? ( halfvetica.zip )
	sans-sans? ( sanssans.zip )
	times-old-roman? ( timesoldroman.zip )
	unicharacter? ( unicharacter.zip )"

SLOT="0"
KEYWORDS="alpha amd64 arm arm64 hppa ia64 ~mips ppc ppc64 s390 sh sparc x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~arm-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~m68k-mint ~sparc-solaris ~x64-solaris ~x86-solaris"
IUSE="+after-impact +bike-courier +cosmic-sans +halfvetica sans-sans times-old-roman unicharacter"
REQUIRED_USE="|| ( after-impact bike-courier cosmic-sans halfvetica sans-sans times-old-roman unicharacter )"

# The last three don't include a license, which is why they're off by default
LICENSE="after-impact? ( Apache-2.0 )
	bike-courier? ( Apache-2.0 )
	halfvetica? ( Apache-2.0 )
	cosmic-sans? ( OFL-1.1 )
	sans-sans? ( all-rights-reserved )
	times-old-roman? ( all-rights-reserved )
	unicharacter? ( all-rights-reserved )"
RESTRICT="fetch
	sans-sans? ( bindist mirror )
	times-old-roman? ( bindist mirror )
	unicharacter? ( bindist mirror )"

DEPEND="app-arch/unzip"
RDEPEND=""

S="${WORKDIR}"
FONT_SUFFIX="ttf"

pkg_nofetch() {
	print_font_file() {
		use $1 && einfo "   $2"
	}

	einfo "Go to https://www.humblebundle.com/store/indiefonts-bundle-freegame"
	einfo "to download the fonts and move the ZIP files to"
	einfo "${DISTDIR}"
	einfo ""
	einfo "You will need the following files for the fonts you selected:"
	print_font_file after-impact afterimpact.zip
	print_font_file bike-courier bikecourier.zip
	print_font_file cosmic-sans cosmicsans.zip
	print_font_file halfvetica halfvetica.zip
	print_font_file sans-sans sanssans.zip
	print_font_file times-old-roman timesoldroman.zip
	print_font_file unicharacter unicharacter.zip
}
