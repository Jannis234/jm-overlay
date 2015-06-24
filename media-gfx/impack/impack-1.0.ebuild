# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Store your data in images"
HOMEPAGE="https://sourceforge.net/projects/jm-impack/"
SRC_URI="http://downloads.sourceforge.net/project/jm-impack/ImPack/${PV}/${P}-src.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE_LINGUAS=" de"
IUSE="${IUSE_LINGUAS// / linguas_}"

RDEPEND=">=dev-lang/mono-3
		 dev-dotnet/gtk-sharp:3"
DEPEND="${RDEPEND}"
S="${WORKDIR}/${P}/ImPack"

src_install() {

	use linguas_de || rm bin/Release/Locale/deu.xml

	emake install PREFIX="${D}/usr"
	
	rm -rf "${D}/usr/share/man" # Let portage handle manpages/docs
	rm -rf "${D}/usr/share/doc"
	doman impack.1
	dodoc README.txt LICENSE.txt

}

