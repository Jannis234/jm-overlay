# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Render images on the terminal"
HOMEPAGE="https://github.com/substack/picture-tube"

NODE_MODULES="picture-tube-1.0.0
	buffers-0.1.1
	charm-0.1.2
	event-stream-0.9.8
		optimist-0.2.8
			wordwrap-0.0.3
	optimist-0.3.7
		wordwrap-0.0.3
	png-js-0.1.1
	request-2.9.203
	x256-0.0.2"
for mod in ${NODE_MODULES}; do
	SRC_URI="${SRC_URI} https://registry.npmjs.org/${mod%-*}/-/${mod}.tgz"
done

LICENSE="MIT Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=">=net-libs/nodejs-0.6.0"

S="${WORKDIR}/${PN}"

unpack_npm_mod() {
	unpack "$1".tgz
	mkdir "${1%-*}" || die
	mv package/* "${1%-*}" || die
	rm -r package || die
}

unpack_npm_deps() {
	mkdir -p "$1/node_modules" || die
	pushd "$1/node_modules" > /dev/null || die
	shift
	for mod in $@; do
		unpack_npm_mod "$mod"
	done
	popd > /dev/null
}

src_unpack() {
	unpack_npm_mod picture-tube-1.0.0
	unpack_npm_deps "${S}" buffers-0.1.1 charm-0.1.2 event-stream-0.9.8 optimist-0.3.7 png-js-0.1.1 request-2.9.203 x256-0.0.2
	unpack_npm_deps "${S}/node_modules/event-stream" optimist-0.2.8
	unpack_npm_deps "${S}/node_modules/event-stream/node_modules/optimist" wordwrap-0.0.3
	unpack_npm_deps "${S}/node_modules/optimist" wordwrap-0.0.3
}

src_install() {
	insinto "/usr/$(get_libdir)/node_modules/${PN}"
	doins -r ./*
	chmod +x "${D}/usr/$(get_libdir)/node_modules/picture-tube/bin/tube.js" || die
	dosym "${EROOT}usr/$(get_libdir)/node_modules/picture-tube/bin/tube.js" /usr/bin/picture-tube
}
