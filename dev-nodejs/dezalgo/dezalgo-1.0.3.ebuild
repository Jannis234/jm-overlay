# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="wrappy:1.0.1
	asap:2.0.3"

inherit node-module

DESCRIPTION="Contain async insanity so that the dark pony lord doesn't eat souls"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
