# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODE_MODULE_EXTRA_FILES="git-host-info.js git-host.js"
NODE_MODULE_HAS_TEST="1"

inherit node-module

DESCRIPTION="Provides metadata from repository urls for Github, Bitbucket and Gitlab"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
DEPEND="${DEPEND}
	test? ( dev-util/tap:0 )"

node_module_run_test() {
	install_node_module_build_depend "tap:0"
	tap test/*.js || die "Tests failed"
}
