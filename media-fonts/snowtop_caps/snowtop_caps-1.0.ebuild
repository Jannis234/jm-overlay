EAPI=5
inherit font

DESCRIPTION="The Snowtop Caps font"
HOMEPAGE="http://www.dafont.com/snowtop-caps.font"

SRC_URI="http://dl.dafont.com/dl/?f=snowtop_caps -> snowtop_caps-${PV}.zip"
LICENSE="freedist"

SLOT="0"
KEYWORDS="alpha amd64 arm arm64 hppa ia64 ~mips ppc ppc64 s390 sh sparc x86 ~amd64-fbsd ~x86-fbsd ~x86-interix ~amd64-linux ~arm-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~m68k-mint ~sparc-solaris ~x64-solaris ~x86-solaris"
IUSE=""
DEPEND="app-arch/unzip"
RDEPEND=""

S="${WORKDIR}"
FONT_S="${S}"
FONT_SUFFIX="otf"

