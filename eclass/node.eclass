# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: node.eclass
# @MAINTAINER:
# Jannis Mast <jannis@ctrl-c.xyz>
# @SUPPORTED_EAPIS: 7
# @BLURB: eclass for node.js packages
# @DESCRIPTION:
# This eclass takes care of installing node.js packages and their dependencies

case ${EAPI:-0} in
	0|1|2|3|4|5|6)
		die "EAPI=${EAPI} is not supported by node.eclass (too old)"
		;;
	7)
		;;
	*)
		die "EAPI=${EAPI} is not supported by node.eclass"
		;;
esac

EXPORT_FUNCTIONS src_unpack src_install

# @ECLASS-VARIABLE: NODE_MODULE_NAME
# @DESCRIPTION:
# The name of the node module that belongs to the package.
# Defaults to ${PN} if not set
if [ -z ${NODE_MODULE_NAME} ]; then
	NODE_MODULE_NAME="${PN}"
fi
# @ECLASS_VARIABLE: NODE_DEPEND
# @DESCRIPTION:
# A list of all node.js modules that this package depends on
# Entries should have the format "name:version"
# @ECLASS_VERIABLE: NODE_BIN
# @DESCRIPTION:
# List of scripts that should be linked into /usr/bin
# Entries should have the format "name:path"
# where "name" is the destination filename in /usr/bin
# and "path" is the relative path of the script in the module's directory
# @ECLASS_VARIABLE: NODEJS_MIN_VERSION
# @DESCRIPTION:
# Minimum version of net-libs/noejs for this package (optional)

SRC_URI="http://registry.npmjs.org/${NODE_MODULE_NAME}/-/${NODE_MODULE_NAME}-${PV}.tgz"
for pkg in ${NODE_DEPEND}; do
	pkg_name="${pkg%:*}"
	pkg_version="${pkg#*:}"
	SRC_URI="${SRC_URI} http://registry.npmjs.org/${pkg_name}/-/${pkg_name}-${pkg_version}.tgz"
done
S="${WORKDIR}/${NODE_MODULE_NAME}"

DEPEND=""
if [ -z ${NODEJS_MIN_VERSION} ]; then
	RDEPEND="net-libs/nodejs"
else
	RDEPEND=">=net-libs/nodejs-${NODEJS_MIN_VERSION}"
fi

node_src_unpack() {
	unpack "${NODE_MODULE_NAME}-${PV}.tgz"
	mv "package" "${NODE_MODULE_NAME}" || die
	mkdir "${NODE_MODULE_NAME}/node_modules" || die
	for pkg in ${NODE_DEPEND}; do
		pkg_name="${pkg%:*}"
		pkg_version="${pkg#*:}"
		unpack "${pkg_name}-${pkg_version}.tgz"
		mv "package" "${NODE_MODULE_NAME}/node_modules/${pkg_name}" || die
	done
}

node_src_install() {
	insinto "/usr/$(get_libdir)/node_modules/${NODE_MODULE_NAME}"
	doins -r .
	for i in ${NODE_BIN}; do
		src="${i#*:}"
		dest="${i%:*}"
		dosym "${EROOT}/usr/$(get_libdir)/node_modules/${NODE_MODULE_NAME}/${src}" "/usr/bin/${dest}"
		fperms +x "/usr/$(get_libdir)/node_modules/${NODE_MODULE_NAME}/${src}"
	done
}
