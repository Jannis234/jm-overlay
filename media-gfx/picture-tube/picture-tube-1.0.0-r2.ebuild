# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="buffers:0.1.1
	charm:0.1.2
	event-stream:0.9.8
	optimist:0.3.7
	png-js:0.1.1
	request:2.9.203
	x256:0.0.2"
NODEJS_MIN_VERSION="0.4.0"
NODE_MODULE_EXTRA_FILES="bin"

inherit node-module

DESCRIPTION="Render 256 color images on the terminal"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

SLOT="0"
DOCS=( README.markdown )

src_install() {
	node-module_src_install
	install_node_module_binary "bin/tube.js" "/usr/bin/picture-tube"
}
