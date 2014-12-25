EAPI=5

inherit eutils java-utils-2 java-pkg-2 java-ant-2

DESCRIPTION="Open source personal backup solution"
HOMEPAGE="http://www.areca-backup.org/"
SRC_TS=$(date +%s) # SourceForge wants a timestamp in the download URL
SRC_URI="http://downloads.sourceforge.net/project/${PN}/${PN}-stable/${P}/${P}-src.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2F${PN}%2Ffiles%2F${PN}-stable%2F${P}%2F&ts=${SRC_TS}&use_mirror=autoselect -> ${P}-src.tar.gz"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
S=${WORKDIR}

RDEPEND=">=virtual/jre-1.4
		 sys-apps/acl
		 dev-java/swt:3.7"
DEPEND="${RDEPEND}
		>=virtual/jdk-1.4
		dev-java/ant-core"

src_prepare() {

	sed -i "s/\/usr\/lib\/java\/swt.jar/\/usr\/share\/swt-3.7\/lib\/swt.jar/" ${WORKDIR}/build.xml || die

}

src_compile() {

	eant || die

}

src_install() {

	dodir /opt/areca/
	cp -R icons/ ${D}/opt/areca/
	cp -R lib/ ${D}/opt/areca/
	cp -R translations/ ${D}/opt/areca/

	exeinto /opt/areca/
	doexe areca.sh
	exeinto /opt/areca/bin
	doexe bin/*.sh

	dodir /opt/areca/plugins/
	dodir /opt/areca/config/

	dodoc AUTHORS COPYING README
	dodoc "help/ADVANCED_ENCRYPTION_HOWTO"

	dosym /usr/share/swt-3.7/lib/swt.jar /opt/areca/lib/swt.jar
	dosym /lib/libacl.so.1 /opt/areca/lib/libacl.so # Areca doesn't support loading linker scripts

	exeinto /usr/bin
	doexe ${FILESDIR}/areca
	make_desktop_entry /usr/bin/areca "Areca Backup" /opt/areca/icons/ico_72.png System

}

