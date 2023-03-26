# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit check-reqs

DESCRIPTION="OpenAI's Whisper models converted to ggml format"
HOMEPAGE="https://huggingface.co/ggerganov/whisper.cpp"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

MODELS=(
	"tiny" "tiny.en"
	"base" "base.en"
	"small" "small.en"
	"medium" "medium.en"
	"large" "large-v1"
)

REQUIRED_USE="|| ("
for i in ${MODELS[@]}; do
	use_default=""
	if [ "$i" == "base" ]; then
		use_default="+"
	elif [ "$i" == "large-v1" ]; then
		use_default="-"
	fi
	IUSE="${IUSE} ${use_default}whisper_models_${i/./-}"
	REQUIRED_USE="${REQUIRED_USE} whisper_models_${i/./-}"
	SRC_URI="${SRC_URI} whisper_models_${i/./-}? ( https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-${i}.bin -> whisper-ggml-${i}.bin )"
done
REQUIRED_USE="${REQUIRED_USE} )"

whisper_check-reqs() {
	req=0
	use whisper_models_large && req=$((req+3000))
	use whisper_models_large-v1 && req=$((req+3000))
	use whisper_models_medium && req=$((req+1500))
	use whisper_models_medium-en && req=$((req+1500))
	use whisper_models_small && req=$((req+500))
	use whisper_models_small-en && req=$((req+500))
	if [ $req -ne 0 ]; then
		CHECKREQS_DISK_BUILD="${req}M"
		CHECKREQS_DISK_USR="${req}M"
		"$@"
	fi
}

pkg_pretend() {
	whisper_check-reqs check-reqs_pkg_pretend
}

pkg_setup() {
	whisper_check-reqs check-reqs_pkg_setup
}

src_unpack() { :; }

src_install() {
	insinto /usr/share/whisper/ggml-models
	for i in ${MODELS[@]}; do
		use whisper_models_${i/./-} && newins "${DISTDIR}/whisper-ggml-${i}.bin" "${i}.bin"
	done
}

pkg_postinst() {
	elog "The models have been installed in"
	elog "   ${EROOT}/usr/share/whisper/ggml-models"
}
