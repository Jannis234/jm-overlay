# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

LODASH_MODULES="array chain collection date function lang math number object string utility"
NODE_MODULE_EXTRA_FILES="internal support.js"
for i in ${LODASH_MODULES}; do
	NODE_MODULE_EXTRA_FILES="${NODE_MODULE_EXTRA_FILES} ${i} ${i}.js"
done

inherit node-module

DESCRIPTION="The modern build of lodash modular utilities"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md )
