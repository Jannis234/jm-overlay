# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

NODE_DEPEND="buffers:0.1.1
	charm:0.1.2
	event-stream:0.9.8
	optimist:0.3.7
	png-js:0.1.1
	request:2.9.203
	wordwrap:0.0.3
	x256:0.0.2"
NODE_BIN="picture-tube:bin/tube.js"
NODEJS_MIN_VERSION="0.6.0"

inherit node

DESCRIPTION="Render 256 color images on the terminal"
HOMEPAGE="https://github.com/substack/picture-tube"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="0"
