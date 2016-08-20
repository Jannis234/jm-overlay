# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="os-homedir:1.0.1
	os-tmpdir:1.0.1"

inherit node-module

DESCRIPTION="Look up environment settings specific to different operating systems"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
