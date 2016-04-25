# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Render images on the terminal"
HOMEPAGE="https://github.com/substack/picture-tube"

NODE_MODULES="picture-tube-1.0.0 {
	buffers-0.1.1
	charm-0.1.2
	event-stream-0.9.8 {
		optimist-0.2.8 {
			wordwrap-0.0.3
		}
	}
	optimist-0.3.7 {
		wordwrap-0.0.3
	}
	png-js-0.1.1
	request-2.9.203
	x256-0.0.2 }"
for mod in ${NODE_MODULES}; do
	if [ "$mod" != "{" -a "$mod" != "}" ]; then
		SRC_URI="${SRC_URI} https://registry.npmjs.org/${mod%-*}/-/${mod}.tgz"
	fi
done

LICENSE="MIT Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=">=net-libs/nodejs-0.6.0"

S="${WORKDIR}/${PN}"

src_unpack() {
	for i in ${NODE_MODULES}; do
		if [ "$i" == "{" ]; then
			cd "${name}" || die
			mkdir node_modules || die
			cd node_modules || die
		elif [ "$i" == "}" ]; then
			cd ../.. || die
		else
			local name="${i%-*}"
			mkdir "${name}" || die
			unpack "$i".tgz
			mv package/* "${name}" || die
			rm -r package || die
		fi
	done
}

src_install() {
	dodoc README.markdown
	rm README.markdown || die

	insinto "/usr/$(get_libdir)/node/${PN}"
	doins -r ./*
	chmod +x "${D}/usr/$(get_libdir)/node/picture-tube/bin/tube.js" || die
	dosym "${EROOT}usr/$(get_libdir)/node/picture-tube/bin/tube.js" /usr/bin/picture-tube
}
