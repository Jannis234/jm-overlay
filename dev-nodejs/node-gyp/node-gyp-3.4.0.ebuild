# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

NODEJS_MIN_VERSION="0.8.0"
NODE_MODULE_EXTRA_FILES="addon.gypi bin gyp src"
NODE_MODULE_DEPEND="rimraf:2.5.4
	graceful-fs:4.1.6
	semver:5.3.0
	osenv:0.1.3
	nopt:3.0.6
	which:1.2.10
	glob:7.0.5
	minimatch:3.0.3
	fstream:1.0.10
	mkdirp:0.5.1
	tar:2.2.1
	npmlog:3.1.2
	request:2.74.0
	path-array:1.0.1"

inherit node-module

DESCRIPTION="Node.js native addon build tool"

LICENSE="MIT BSD"
KEYWORDS="~amd64 ~x86"

RESTRICT="test" # Broken
DOCS=( README.md CHANGELOG.md History.md )

src_install() {
	# Remove some unneeded files from the bundled version of gyp
	newdoc gyp/AUTHORS GYP_AUTHORS
	rm -r gyp/AUTHORS gyp/DEPS gyp/gyp.bat gyp/LICENSE gyp/OWNERS gyp/PRESUBMIT.py \
		gyp/samples gyp/buildbot gyp/tools/README gyp/tools/emacs gyp/tools/Xcode || die

	node-module_src_install
}
