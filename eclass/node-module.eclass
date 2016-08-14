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

EXPORT_FUNCTIONS src_install src_test

# @ECLASS-VARIABLE: NODE_MODULE_NAME
# @DESCRIPTION:
# The module's name. Defaults to ${PN} if not set
if [ -z ${NODE_MODULE_NAME} ]; then
	NODE_MODULE_NAME="${PN}"
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
# @ECLASS_VARIABLE: NODE_MODULE_DEPEND
# @DESCRIPTION:
# A list of packages that this Node.js module depends on
# Entries should have the format "module:version"
# @ECLASS_VARIABLE: NODE_MODULE_HAS_TEST
# @DESCRIPTION:
# Set this variable to indicate that the ebuild implements src_test()
# This will only set up DEPEND and IUSE correctly, you must still
# implement src_test() yourself. If this is not set, a dummy src_test()
# function that does nothing is exported
# @ECLASS_VARIABLE: NODE_MODULE_TEST_DEPEND
# @DESCRIPTION:
# Similar to NODE_MODULE_DEPEND, this contains a list of dependencies
# that are needed for src_test(). This will be ignored if NODE_MODULE_HAS_TEST
# is not set.
# @ECLASS_VARIABLE: NODEJS_MIN_VERSION
# @DESCRIPTION:
# Set this if your module needs a specific version of Node.js to work

HOMEPAGE="https://www.npmjs.org/package/${NODE_MODULE_NAME}"
SRC_URI="http://registry.npmjs.org/${NODE_MODULE_NAME}/-/${NODE_MODULE_NAME}-${PV}.tgz"
SLOT="${PV}"
S="${WORKDIR}/package"

DEPEND=""
if [ -z ${NODEJS_MIN_VERSION} ]; then
	RDEPEND="net-libs/nodejs"
else
	RDEPEND=">=net-libs/nodejs-${NODEJS_MIN_VERSION}"
fi
for pkg in ${NODE_MODULE_DEPEND}; do
	RDEPEND="${RDEPEND} dev-nodejs/${pkg}"
done

if [ ! -z ${NODE_MODULE_HAS_TEST} ]; then
	IUSE="test"
	DEPEND="test? ( ${RDEPEND}"
	for pkg in ${NODE_MODULE_TEST_DEPEND}; do
		DEPEND="${DEPEND} dev-nodejs/${pkg}"
	done
	DEPEND="${DEPEND} )"
fi

if [ ${EAPI:-0} == 5 ]; then
	node-module_src_prepare() {
		default_src_prepare
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
	einfo "Installing symlink to dependency ${name}:${version}"
	[ -e "${EROOT}usr/$(get_libdir)/node/${name}/${version}" ] || die "Node.js module ${name}:${version} not found"
	dosym "${EROOT}usr/$(get_libdir)/node/${name}/${version}" "/usr/$(get_libdir)/node/${NODE_MODULE_NAME}/${SLOT}/node_modules/${name}"
}

# @FUNCTION: install_node_module_build_depend
# @USAGE: <module>
# @DESCRIPTION:
# Creates a symlink to the specified Node.js module
# into the build directory
install_node_module_build_depend() {
	[[ ${#} -eq 1 ]] || die "Invalid arguments to install_node_module_build_depend"

	local version="${1#*:}"
	local name="${1%:*}"
	einfo "Creating symlink to dependency ${name}:${version}"
	[ -e "${EROOT}usr/$(get_libdir)/node/${name}/${version}" ] || die "Node.js module ${name}:${version} not found"
	mkdir -p "node_modules" || die
	ln -s "${EROOT}usr/$(get_libdir)/node/${name}/${version}" "node_modules/${name}" || die
}

# @FUNCTION: install_node_module_binary
# @USAGE: <path> <target>
# Installs a symlink to a binary inside the Node.js module
install_node_module_binary() {
	[[ ${#} -eq 2 ]] || die "Invalid arguments to install_node_module_binary"

	einfo "Installing symlink to executable $1"
	[ -e "${S}/$1" ] || die "Executable $1 not found"
	fperms +x "/usr/$(get_libdir)/node/${NODE_MODULE_NAME}/${SLOT}/$1"
	dosym "${EROOT}usr/$(get_libdir)/node/${NODE_MODULE_NAME}/${SLOT}/$1" "$2"
}

if [ -z ${NODE_MODULE_HAS_TEST} ]; then
	# Don't run the default src_test() function which will often cause errors if a Makefile is present
	node-module_src_test() { :; }
else
	# This does not run any tests by itself, it only sets up dependencies
	node-module_src_test() {
		for dep in ${NODE_MODULE_DEPEND} ${NODE_MODULE_TEST_DEPEND}; do
			install_node_module_build_depend "${dep}"
		done
	}
fi

node-module_src_install() {
	einstalldocs

	insinto "/usr/$(get_libdir)/node/${NODE_MODULE_NAME}/${SLOT}"
	# Default files - might or might not be present
	for f in ${NODE_MODULE_DEFAULT_FILES}; do
		if [ -e "$f" ]; then
			doins -r "$f"
		fi
	done
	# These were manually added to the ebuild, fail if one doesn't exist
	if [ "${NODE_MODULE_EXTRA_FILES}" ]; then
		for f in ${NODE_MODULE_EXTRA_FILES}; do
			doins -r "$f"
		done
	fi

	for dep in ${NODE_MODULE_DEPEND}; do
		install_node_module_depend "${dep}"
	done
}
