# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="git-host-info.js git-host.js"

inherit node-module

DESCRIPTION="Provides metadata from repository urls for Github, Bitbucket and Gitlab"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( README.md )
