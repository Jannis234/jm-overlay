# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="0.8.6"
NODE_MODULE_EXTRA_FILES="bin"
NODE_MODULE_HAS_TEST=1""
NODE_MODULE_DEPEND="js-yaml:3.6.1
	lcov-parse:0.0.10
	log-driver:1.2.5
	minimist:1.2.0
	request:2.79.0"
NODE_MODULE_TEST_DEPEND="sinon-restore:1.0.1
	should:9.0.2"

inherit node-module

DESCRIPTION="Takes json-cov output into stdin and POSTs to coveralls.io"

LICENSE="BSD-2"
KEYWORDS="~amd64 ~x86"

DOCS=( README.md )
DEPEND="${DEPEND}
	test? (
		dev-util/mocha
		dev-vcs/git
	)"
S="${WORKDIR}/node-coveralls"

src_unpack() {
	default
	mv "${WORKDIR}/package" "${WORKDIR}/node-coveralls" # Needed for the tests to work
}

src_compile() { :; }

node_module_run_test() {
	# Create a dummy git repo with everything that is required by the testsuite
	git init --quiet || die
	git config user.name "Dummy" || die
	git config user.email "Dummy" || die
	git commit --allow-empty --message="Dummy" --quiet || die
	git remote add "Dummy" "Dummy" || die

	rm "test/sendToCoveralls.js" || die # Connects to an external service
	mocha || die "Tests failed"
}
