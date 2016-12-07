# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="template_src"

inherit node-module

DESCRIPTION="This is the hello world app used by the \"cordova create\" command"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md CONTRIBUTING.md NOTICE RELEASENOTES.md )
