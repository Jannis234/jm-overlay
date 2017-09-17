# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

NODEJS_MIN_VERSION="0.10.0"
NODE_MODULE_DEPEND="filename-regex:2.0.0
	is-extglob:1.0.0
	array-unique:0.2.1
	extglob:0.3.2
	is-glob:2.0.1
	normalize-path:2.0.1
	arr-diff:2.0.0
	expand-brackets:0.1.5
	regex-cache:0.4.3
	kind-of:3.0.4
	parse-glob:3.0.4
	braces:1.8.5"

inherit node-module

RDEPEND="${RDEPEND}
	dev-nodejs/object-omit:2.0.0"

DESCRIPTION="Glob matching for javascript/node.js"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

src_install() {
	node-module_src_install
	install_node_module_depend "object.omit:2.0.0"
}
