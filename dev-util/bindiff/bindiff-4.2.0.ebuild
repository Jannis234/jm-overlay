# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit unpacker eutils

MyPV="420"
MyP="${PN}${MyPV}"

DESCRIPTION="Quickly find differences and similarities in disassembled code"
HOMEPAGE="http://www.zynamics.com/bindiff.html"
SRC_URI="amd64? ( https://dl.google.com/dl/zynamics/${MyP}-debian8-amd64.deb )
	x86? ( https://dl.google.com/dl/zynamics/${MyP}-debian8-i386.deb )
	https://dl.google.com/dl/zynamics/bindiff-license-key.zip"

LICENSE="zynamics-bindiff-eula"
SLOT="0"
KEYWORDS="-* ~amd64 ~x86"
IUSE="doc examples"

RDEPEND="virtual/jre"
DEPEND=""

RESTRICT="bindist mirror"
S="${WORKDIR}"
QA_PREBUILT="opt/zynamics/BinDiff/bin/differ
	opt/zynamics/BinDiff/plugins/*"

src_prepare() {
	default

	sed -i "/JAVA=/c\JAVA=java" \
		opt/zynamics/BinDiff/bin/bindiff.sh || die
}

src_install() {
	insinto /etc
	doins -r etc/opt

	cd opt/zynamics/BinDiff || die
	insinto /opt/zynamics/BinDiff
	doins -r bin plugins
	chmod +x "${D}/opt/zynamics/BinDiff/bin/"{bindiff.sh,differ} "${D}/opt/zynamics/BinDiff/plugins/"*

	insinto "/opt/zynamics/BinDiff/bin"
	doins "${S}/zynamics BinDiff License Key.txt"

	use examples && dodoc -r doc/sample_files
	if use doc; then
		docinto html
		dodoc -r doc/index.html doc/images doc/styles
	fi

	dosym "${EROOT}opt/zynamics/BinDiff/bin/bindiff.sh" /opt/bin/bindiff
	dosym "${EROOT}opt/zynamics/BinDiff/bin/differ" /opt/bin/differ
	make_desktop_entry "${EROOT}opt/zynamics/BinDiff/bindiff.sh" "BinDiff" "${EROOT}opt/zynamics/BinDiff/bin/bindiff-256x256-rgba.png"
}

pkg_postint() {
	elog "Please note that you need the commercial IDA Pro disassembler to use BinDiff"
	elog "You can configure the location where IDA is installed in BinDiff's settings"
}
