# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_DEPEND="events-to-array:1.0.2
	js-yaml:3.6.1
	readable-stream:2.1.5"

inherit node-module

DESCRIPTION="Parse the test anything protocol"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DOCS=( readme.markdown )
