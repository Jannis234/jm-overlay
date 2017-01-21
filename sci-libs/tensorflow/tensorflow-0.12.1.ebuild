# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5} )
DISTUTILS_OPTIONAL=1

inherit python-r1 distutils-r1 git-r3

DESCRIPTION="Computation using data flow graphs for scalable machine learning"
HOMEPAGE="https://www.tensorflow.org/"
SRC_URI="https://github.com/tensorflow/tensorflow/archive/${PV}.tar.gz -> ${P}.tar.gz
	http://bitbucket.org/eigen/eigen/get/62bdceacdafa.tar.gz
	http://github.com/google/re2/archive/b94b7cd42e9f02673cd748c1ac1d16db4052514c.tar.gz
	http://github.com/google/gemmlowp/archive/a6f29d8ac48d63293f845f2253eccbf86bc28321.tar.gz
	http://github.com/google/farmhash/archive/92e897b282426729f4724d91a637596c7e2fe28f.zip
	http://github.com/google/highwayhash/archive/4bce8fc6a9ca454d9d377dbc4c4d33488bbab78f.tar.gz
	http://www.nasm.us/pub/nasm/releasebuilds/2.12.02/nasm-2.12.02.tar.bz2
	https://github.com/libjpeg-turbo/libjpeg-turbo/archive/1.5.1.tar.gz -> libjpeg-turbo-1.5.1.tar.gz
	http://github.com/glennrp/libpng/archive/v1.2.53.zip -> libpng-1.2.53.zip
	http://cdimage.debian.org/mirror/xbmc.org/build-deps/sources/giflib-5.1.4.tar.gz
	http://pypi.python.org/packages/source/s/six/six-1.10.0.tar.gz
	http://github.com/google/protobuf/archive/008b5a228b37c054f46ba478ccafa5e855cb16db.tar.gz
	http://pkgs.fedoraproject.org/repo/pkgs/gmock/gmock-1.7.0.zip/073b984d8798ea1594f5e44d85b20d66/gmock-1.7.0.zip
	http://ftp.exim.org/pub/pcre/pcre-8.39.tar.gz
	http://cdimage.debian.org/mirror/xbmc.org/build-deps/sources/swig-3.0.8.tar.gz
	http://github.com/grpc/grpc/archive/d7ff4ff40071d2b486a052183e3e9f9382afb745.tar.gz
	http://github.com/open-source-parsers/jsoncpp/archive/11086dd6a7eba04289944367ca82cea71299ed70.tar.gz
	http://github.com/google/boringssl/archive/bbcaa15b0647816b9a1a9b9e0d209cd6712f0105.tar.gz
	http://github.com/nanopb/nanopb/archive/1251fa1065afc0d62f635e0f63fec8276e14e13c.tar.gz
	http://zlib.net/zlib-1.2.8.tar.gz
	https://storage.googleapis.com/download.tensorflow.org/models/inception5h.zip
	https://github.com/mbostock-bower/d3-bower/archive/v3.5.15.tar.gz -> d3-bower-3.5.15.tar.gz
	https://cdnjs.cloudflare.com/ajax/libs/numeric/1.2.6/numeric.min.js -> numeric-1.2.6.min.js
	https://raw.githubusercontent.com/mrdoob/three.js/r77/build/three.min.js -> three-r77.min.js
	https://raw.githubusercontent.com/mrdoob/three.js/r77/examples/js/controls/OrbitControls.js -> OrbitControls-r77.js
	https://raw.githubusercontent.com/waylonflinn/weblas/v0.9.0/dist/weblas.js -> weblas-0.9.0.js
	https://github.com/cpettitt/dagre/archive/v0.7.4.tar.gz -> dagre-0.7.4.tar.gz
	https://github.com/components/es6-promise/archive/v2.1.0.tar.gz -> es6-promise-2.1.0.tar.gz
	https://github.com/polymerelements/font-roboto/archive/v1.0.1.tar.gz -> font-roboto-1.0.1.tar.gz
	https://github.com/cpettitt/graphlib/archive/v1.0.7.tar.gz -> graphlib-1.0.7.tar.gz
	https://github.com/polymerelements/iron-a11y-announcer/archive/v1.0.5.tar.gz -> iron-a11y-announcer-1.0.5.tar.gz
	https://github.com/polymerelements/iron-a11y-keys-behavior/archive/v1.1.8.tar.gz -> iron-a11y-keys-behavior-1.1.8.tar.gz
	https://github.com/polymerelements/iron-ajax/archive/v1.2.0.tar.gz -> iron-ajax-1.2.0.tar.gz
	https://github.com/polymerelements/iron-autogrow-textarea/archive/v1.0.12.tar.gz -> iron-autogrow-textarea-1.0.12.tar.gz
	https://github.com/polymerelements/iron-behaviors/archive/v1.0.17.tar.gz -> iron-behaviors-1.0.17.tar.gz
	https://github.com/polymerelements/iron-checked-element-behavior/archive/v1.0.4.tar.gz -> iron-checked-element-behavior-1.0.4.tar.gz
	https://github.com/polymerelements/iron-collapse/archive/v1.0.8.tar.gz -> iron-collapse-1.0.8.tar.gz
	https://github.com/polymerelements/iron-dropdown/archive/v1.4.0.tar.gz -> iron-dropdown-1.4.0.tar.gz
	https://github.com/polymerelements/iron-fit-behavior/archive/v1.2.5.tar.gz -> iron-fit-behavior-1.2.5.tar.gz
	https://github.com/polymerelements/iron-flex-layout/archive/v1.3.0.tar.gz -> iron-flex-layout-1.3.0.tar.gz
	https://github.com/polymerelements/iron-form-element-behavior/archive/v1.0.6.tar.gz -> iron-form-element-behavior-1.0.6.tar.gz
	https://github.com/polymerelements/iron-icon/archive/v1.0.11.tar.gz -> iron-icon-1.0.11.tar.gz
	https://github.com/polymerelements/iron-icons/archive/v1.1.3.tar.gz -> iron-icons-1.1.3.tar.gz
	https://github.com/polymerelements/iron-iconset-svg/archive/v1.1.0.tar.gz -> iron-iconset-svg-1.1.0.tar.gz
	https://github.com/polymerelements/iron-input/archive/1.0.10.tar.gz -> iron-input-1.0.10.tar.gz
	https://github.com/polymerelements/iron-list/archive/v1.3.9.tar.gz -> iron-list-1.3.9.tar.gz
	https://github.com/polymerelements/iron-menu-behavior/archive/v1.1.10.tar.gz -> iron-menu-behavior-1.1.10.tar.gz
	https://github.com/polymerelements/iron-meta/archive/v1.1.1.tar.gz -> iron-meta-1.1.1.tar.gz
	https://github.com/polymerelements/iron-overlay-behavior/archive/v1.10.1.tar.gz -> iron-overlay-behavior-1.10.1.tar.gz
	https://github.com/polymerelements/iron-range-behavior/archive/v1.0.4.tar.gz -> iron-range-behavior-1.0.4.tar.gz
	https://github.com/polymerelements/iron-resizable-behavior/archive/v1.0.3.tar.gz -> iron-resizable-behavior-1.0.3.tar.gz
	https://github.com/polymerelements/iron-scroll-target-behavior/archive/v1.0.3.tar.gz -> iron-scroll-target-behavior-1.0.3.tar.gz
	https://github.com/polymerelements/iron-selector/archive/v1.5.2.tar.gz -> iron-selector-1.5.2.tar.gz
	https://github.com/polymerelements/iron-validatable-behavior/archive/v1.1.1.tar.gz -> iron-validatable-behavior-1.1.1.tar.gz
	https://github.com/lodash/lodash/archive/3.8.0.tar.gz -> lodash-3.8.0.tar.gz
	https://github.com/polymerelements/neon-animation/archive/v1.2.2.tar.gz -> neon-animation-1.2.2.tar.gz
	https://github.com/polymerelements/paper-behaviors/archive/v1.0.12.tar.gz -> paper-behaviors-1.0.12.tar.gz
	https://github.com/polymerelements/paper-button/archive/v1.0.11.tar.gz -> paper-button-1.0.11.tar.gz
	https://github.com/polymerelements/paper-checkbox/archive/v1.4.0.tar.gz -> paper-checkbox-1.4.0.tar.gz
	https://github.com/polymerelements/paper-dialog/archive/v1.0.4.tar.gz -> paper-dialog-1.0.4.tar.gz
	https://github.com/polymerelements/paper-dialog-behavior/archive/v1.2.5.tar.gz -> paper-dialog-behavior-1.2.5.tar.gz
	https://github.com/polymerelements/paper-dialog-scrollable/archive/1.1.5.tar.gz -> paper-dialog-scrollable-1.1.5.tar.gz
	https://github.com/polymerelements/paper-dropdown-menu/archive/v1.4.0.tar.gz -> paper-dropdown-menu-1.4.0.tar.gz
	https://github.com/polymerelements/paper-header-panel/archive/v1.1.4.tar.gz -> paper-header-panel-1.1.4.tar.gz
	https://github.com/polymerelements/paper-icon-button/archive/v1.1.3.tar.gz -> paper-icon-button-1.1.3.tar.gz
	https://github.com/polymerelements/paper-input/archive/v1.1.18.tar.gz -> paper-input-1.1.18.tar.gz
	https://github.com/polymerelements/paper-item/archive/v1.1.4.tar.gz -> paper-item-1.1.4.tar.gz
	https://github.com/polymerelements/paper-listbox/archive/v1.1.2.tar.gz -> paper-listbox-1.1.2.tar.gz
	https://github.com/polymerelements/paper-material/archive/v1.0.6.tar.gz -> paper-material-1.0.6.tar.gz
	https://github.com/polymerelements/paper-menu/archive/v1.2.2.tar.gz -> paper-menu-1.2.2.tar.gz
	https://github.com/polymerelements/paper-menu-button/archive/v1.5.1.tar.gz -> paper-menu-button-1.5.1.tar.gz
	https://github.com/polymerelements/paper-progress/archive/v1.0.9.tar.gz -> paper-progress-1.0.9.tar.gz
	https://github.com/polymerelements/paper-radio-button/archive/v1.1.2.tar.gz -> paper-radio-button-1.1.2.tar.gz
	https://github.com/polymerelements/paper-radio-group/archive/v1.0.9.tar.gz -> paper-radio-group-1.0.9.tar.gz
	https://github.com/polymerelements/paper-ripple/archive/v1.0.5.tar.gz -> paper-ripple-1.0.5.tar.gz
	https://github.com/polymerelements/paper-slider/archive/v1.0.10.tar.gz -> paper-slider-1.0.10.tar.gz
	https://github.com/polymerelements/paper-spinner/archive/v1.1.1.tar.gz -> paper-spinner-1.1.1.tar.gz
	https://github.com/polymerelements/paper-styles/archive/v1.1.4.tar.gz -> paper-styles-1.1.4.tar.gz
	https://github.com/polymerelements/paper-tabs/archive/v1.7.0.tar.gz -> paper-tabs-1.7.0.tar.gz
	https://github.com/polymerelements/paper-toast/archive/v1.3.0.tar.gz -> paper-toast-1.3.0.tar.gz
	https://github.com/polymerelements/paper-toggle-button/archive/v1.2.0.tar.gz -> paper-toggle-button-1.2.0.tar.gz
	https://github.com/polymerelements/paper-toolbar/archive/v1.1.4.tar.gz -> paper-toolbar-1.1.4.tar.gz
	https://github.com/polymerelements/paper-tooltip/archive/v1.1.2.tar.gz -> paper-tooltip-1.1.2.tar.gz
	https://github.com/palantir/plottable/archive/v1.16.1.tar.gz -> plottable-1.16.1.tar.gz
	https://github.com/polymer/polymer/archive/v1.7.0.tar.gz -> polymer-1.7.0.tar.gz
	https://github.com/polymerlabs/promise-polyfill/archive/v1.0.0.tar.gz -> promise-polyfill-1.0.0.tar.gz
	https://github.com/web-animations/web-animations-js/archive/2.2.1.tar.gz -> web-animations-js-2.2.1.tar.gz
	https://github.com/webcomponents/webcomponentsjs/archive/v0.7.22.tar.gz -> webcomponentsjs-0.7.22.tar.gz"
LINENOISE_URI="https://github.com/antirez/linenoise.git"
LINENOISE_COMMIT="c894b9e59f02203dbe4e2be657572cf88c4230c3"

LICENSE="Apache-2.0 BSD BSD-2 ZLIB MIT MPL-2.0 IJG"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gcp hdfs"

RDEPEND="dev-python/numpy[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	>=dev-util/bazel-0.3.2
	app-arch/unzip"

src_unpack() {
	default
	mkdir inception5h || die
	mv imagenet_comp_graph_label_strings.txt tensorflow_inception_graph.pb LICENSE inception5h/ || die
	cp "${DISTDIR}/numeric-1.2.6.min.js" "${S}/tensorflow/tensorboard/bower/numeric.min.js" || die
	cp "${DISTDIR}/three-r77.min.js" "${S}//tensorflow/tensorboard/bower/three.min.js" || die
	cp "${DISTDIR}/OrbitControls-r77.js" "${S}//tensorflow/tensorboard/bower/OrbitControls.js" || die
	cp "${DISTDIR}/weblas-0.9.0.js" "${S}//tensorflow/tensorboard/bower/weblas.js" || die
	git-r3_fetch "${LINENOISE_URI}" "${LINENOISE_FETCH}"
	git-r3_checkout "${LINENOISE_URI}" "${WORKDIR}/${LINENOISE_COMMIT}"
}

src_prepare() {
	sed -i "/bazel fetch/d" configure || die
	# Convert remote repositories to local paths to prevent bazel from downloading during src_compile
	eapply "${FILESDIR}/${P}-3rdparty-offline-sed.patch"
	sed -i -e "s/new_http_archive/new_local_repository/g" \
		-e "s/http_archive/local_repository/g" \
		-e "s/new_git_repository/new_local_repository/g" \
		-e "s/git_repository/local_repository/g" \
		-e "/url =/d" \
		-e "/sha256 =/d" \
		-e "/remote =/d" \
		-e "/init_submodules =/d" \
		-e "s|strip_prefix = \"|path = \"${WORKDIR}/|g" \
		-e "s|commit = \"|path = \"${WORKDIR}/|g" \
		WORKSPACE tensorflow/workspace.bzl || die

	eapply_user
	python_copy_sources
}

src_configure() {
	do_configure() {
		cd "${BUILD_DIR}" || die
		python_export PYTHON_SITEDIR
		# CUDA and OpenCL need packages that aren't available in portage
		TF_NEED_GCP=$(usex gcp 1 0) \
			TF_NEED_HDFS=$(usex hdfs 1 0) \
			TF_NEED_OPENCL=0 \
			TF_NEED_CUDA=0 \
			PYTHON_BIN_PATH="${PYTHON}" \
			PYTHON_LIB_PATH="${PYTHON_SITEDIR}" \
			./configure || die
		bazel shutdown || die
	}
	python_foreach_impl do_configure
}

src_compile() {
	do_compile() {
		cd "${BUILD_DIR}" || die
		bazel build -c opt //tensorflow/tools/pip_package:build_pip_package || die
		bazel shutdown || die

		mkdir _python_build || die
		cd _python_build || die
		ln -s ../bazel-bin/tensorflow/tools/pip_package/build_pip_package.runfiles/org_tensorflow/* ../tensorflow/tools/pip_package/* ./ || die
		esetup.py build
	}
	python_foreach_impl do_compile
}

src_install() {
	do_install() {
		cd "${BUILD_DIR}" || die
		cd _python_build || die
		esetup.py install
	}
	dodoc AUTHORS CONTRIBUTING.md ISSUE_TEMPLATE.md README.md RELEASE.md
	python_foreach_impl do_install
}
