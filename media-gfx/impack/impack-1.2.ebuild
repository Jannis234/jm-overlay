# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit multilib eutils

DESCRIPTION="Store your data in images"
HOMEPAGE="https://sourceforge.net/projects/jm-impack/"
SRC_URI="http://downloads.sourceforge.net/project/jm-impack/ImPack/${PV}/${P}-src.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IMPACK_LINGUAS=( de )
IUSE="doc ${IMPACK_LINGUAS[@]/#/linguas_}"

RDEPEND=">=dev-lang/mono-3
	dev-dotnet/gtk-sharp:3"
DEPEND="${RDEPEND}"
S="${WORKDIR}/${P}/ImPack"

src_prepare() {
	sed -i "/Icon/d" impack.desktop || die # Some desktops don't find the icon if /usr/lib is a symlink
	echo "Icon=/usr/$(get_libdir)/impack/ImPack.png" >> impack.desktop

	epatch_user
}

src_install() {
	use linguas_de || rm bin/Release/Locale/deu.xml

	emake install PREFIX="${D}/usr"

	rm -rf "${D}/usr/share/man" # Let portage handle manpages/docs
	rm -rf "${D}/usr/share/doc"
	doman impack.1
	dodoc README.txt ChangeLog.txt

	use doc && dodoc -r ./Doc/Image_Format
}
