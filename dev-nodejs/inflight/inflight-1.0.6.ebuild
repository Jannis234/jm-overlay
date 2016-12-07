# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_DEPEND="wrappy:1.0.2
	once:1.4.0"

inherit node-module

DESCRIPTION="Add callbacks to requests in flight to avoid async duplication"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
