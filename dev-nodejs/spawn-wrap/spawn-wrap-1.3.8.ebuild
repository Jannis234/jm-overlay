# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODE_MODULE_EXTRA_FILES="shim.js"
NODE_MODULE_DEPEND="foreground-child:1.5.6
	mkdirp:0.5.1
	os-homedir:1.0.2
	rimraf:2.6.2
	signal-exit:3.0.2
	which:1.3.0"

inherit node-module

DESCRIPTION="Wrap all spawned Node.js child processes"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
