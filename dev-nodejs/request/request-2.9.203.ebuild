# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.3.6"
NODE_MODULE_EXTRA_FILES="aws.js aws2.js forever.js main.js mimetypes.js oauth.js tunnel.js uuid.js vendor"

inherit node-module

DESCRIPTION="Simplified HTTP request client"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md )
