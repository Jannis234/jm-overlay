# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

# @ECLASS: node-module.eclass
# @MAINTAINER:
# Jannis Mast <jannis@hackbraten.men>
# @BLURB: eclass for installing Node.js modules
# @DESCRIPTION:
# This eclass allows easy installation of Node.js modules
# It is designed to allow installing multiple versions of a module
# at the same time, because many Node.js modules depend on an exact
# version of another module.
# Note that Node.js will not find modules installed by this eclass by default.
# Because of that, this eclass is mostly intended to install dependencies of
# Node.js-based programs.

case ${EAPI:-0} in
	0|1|2|3|4)
		die "EAPI=${EAPI} is not supported by node-module.eclass (too old)"
		;;
	5)
		inherit multilib
		EXPORT_FUNCTIONS src_prepare
		;;
	6)
		;;
	*)
		die "EAPI=${EAPI} is not supported by node-module.eclass"
		;;
esac

inherit eutils

EXPORT_FUNCTIONS src_install

# @ECLASS-VARIABLE: NODE_MODULE_NAME
# @DESCRIPTION:
# The module's name. Defaults to ${PV} if not set
if [ -z ${NODE_MODULE_NAME} ]; then
	NODE_MODULE_NAME="${PV}"
fi
# @ECLASS_VARIABLE: NODE_MODULE_DEFAULT_FILES
# @DESCRIPTION:
# Default list of files/directories that are normally part of a Node.js module
NODE_MODULE_DEFAULT_FILES="index.js ${NODE_MODULE_NAME}.js package.json lib"
# @ECLASS_VARIABLE: NODE_MODULE_EXTRA_FILES
# @DESCRIPTION:
# List of additional files/directories that need to be installed
# Set this if your package includes additional files/directories that are
# not part of NODE_MODULE_DEFAULT_FILES
# @ECLASS_VARIABLE: NODE_MODULE_INSTALL_PATH
# @DESCRIPTION:
# Path where Node.js modules are installed
NODE_MODULE_INSTALL_PATH="${EROOT}usr/$(get_libdir)/node"
# @ECLASS_VARIABLE: NODE_MODULE_DEPEND
# @DESCRIPTION:
# A list of packages that this Node.js module depends on
# Entries should have the format "module:version"
# @ECLASS_VARIABLE: NODEJS_MIN_VERSION
# @DESCRIPTION:
# Set this if your module needs a specific version of Node.js to work

HOMEPAGE="https://www.npmjs.org/package/${NODE_MODULE_NAME}"
SRC_URI="http://registry.npmjs.org/${NODE_MODULE_NAME}/-/${NODE_MODULE_NAME}-${PV}.tgz"
SLOT="${PV}"

DEPEND=""
if [ -z ${NODEJS_MIN_VERSION} ]; then
	RDEPEND="net-libs/nodejs"
else
	RDEPEND=">=net-libs/nodejs-${NODEJS_MIN_VERSION}"
fi
for pkg in ${NODE_MODULE_DEPEND}; do
	RDEPEND="${RDEPEND} dev-nodejs/${pkg}"
done

if [ ${EAPI:-0} == 5 ]; then
	node-module-src_prepare() {
		default-src_prepare
		epatch_user
	}
fi

# @FUNCTION: install_node_module_depend
# @USAGE: <module>
# @DESCRIPTION:
# Installs a symlink to the specified Node.js module
# into the node_modules directory
install_node_module_depend() {
	[[ ${#} -eq 1 ]] || die "Invalid arguments to install_node_module_depend"

	local version="${1#*:}"
	local name="${1%:*}"
	dosym "${NODE_MODULE_INSTALL_PATH}/${name}/${version}" "${D}/${NODE_MODULE_INSTALL_PATH}/${NODE_MODULE_NAME}/${SLOT}/node_modules/${name}"
}

node-module-src_install() {
	einstalldocs

	insinto "${NODE_MODULE_INSTALL_PATH}/${NODE_MODULE_NAME}/${SLOT}"
	for f in ${NODE_MODULE_DEFAULT_FILES} ${NODE_MODULE_EXTRA_FILES}; do
		if [ -e "$f" ]; then
			doins -r "$f"
		fi
	done

	for dep in ${NODE_MODULE_DEPEND}; do
		install_node_module_depend "${dep}"
	done
}
