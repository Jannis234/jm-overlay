# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MyPN="SatDump"
MyP="${MyPN}-${PV}"

inherit cmake

DESCRIPTION="A generic satellite data processing software"
HOMEPAGE="https://www.satdump.org/"
SRC_URI="https://github.com/SatDump/SatDump/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cpu_flags_arm_neon cpu_flags_x86_sse4_1 gles gui opencl openmp tools ziq2 zstd"

SATDUMP_PLUGINS="aim airspy_sdr analog bladerf_sdr bluewalker3 bochum cluster cubesat dmsp dscovr dvb elektro_arktika eos fy2 fy3 fy4 gcom geonetcast gk2a goes gvar_extended hackrf_sdr himawari hinode inmarsat jason3 jpss landsat limesdr_sdr mats meteor mirisdr_sdr net_source_sdr noaa_metop oceansat orbcomm others plutosdr_sdr portaudio_sink proba remote_sdr rtaudio_sdr rtaudio_sink rtlsdr_sdr rtltcp scripting sddc_sdr sdrplay_sdr sdrpp_server soapy_sdr spacex spyserver standard_cpp_compos stereo tubsat umka usrp_sdr wsf"
for i in ${SATDUMP_PLUGINS}; do
	IUSE="${IUSE} satdump_plugins_$i"
done

S="${WORKDIR}/${MyP}"

DEPEND="dev-libs/jemalloc:=
	dev-libs/nng:=
	media-libs/libpng:=
	media-libs/tiff:=
	sci-libs/armadillo:=
	sci-libs/fftw:3.0=
	sci-libs/volk:=
	gles? (
		>=media-libs/mesa-24.1.0_rc1[opengl]
		<media-libs/mesa-24.1.0_rc1[gles2]
	)
	gui? ( media-libs/glfw:= )
	opencl? ( virtual/opencl )
	ziq2? ( app-arch/zstd:= )
	zstd? ( app-arch/zstd:= )
	satdump_plugins_airspy_sdr? ( net-wireless/airspy:= )
	satdump_plugins_bladerf_sdr? ( net-wireless/bladerf:= )
	satdump_plugins_geonetcast? ( sci-libs/hdf5:= )
	satdump_plugins_hackrf_sdr? ( net-libs/libhackrf:= )
	satdump_plugins_limesdr_sdr? ( net-wireless/limesuite:= )
	satdump_plugins_mirisdr_sdr? ( virtual/libusb:1 )
	satdump_plugins_plutosdr_sdr? (
		net-libs/libad9361-iio:=
		net-libs/libiio:=
	)
	satdump_plugins_portaudio_sink? ( media-libs/portaudio:= )
	satdump_plugins_rtaudio_sdr? ( media-libs/rtaudio:= )
	satdump_plugins_rtaudio_sink? ( media-libs/rtaudio:= )
	satdump_plugins_rtlsdr_sdr? ( net-wireless/rtl-sdr:= )
	satdump_plugins_sddc_sdr? ( virtual/libusb:1 )
	satdump_plugins_sdrplay_sdr? ( net-wireless/sdrplay:= )
	satdump_plugins_sdrpp_server? ( app-arch/zstd:= )
	satdump_plugins_soapy_sdr? ( net-wireless/soapysdr:= )
	satdump_plugins_usrp_sdr? ( net-wireless/uhd:= )
"
RDEPEND="${DEPEND}"
BDEPEND=""
REQUIRED_USE="gles? ( gui )"

src_prepare() {
	sed -i "s|/lib/satdump/|/$(get_libdir)/satdump/|g" src-core/CMakeLists.txt || die
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_GLES=$(usex gles ON OFF)
		-DBUILD_GUI=$(usex gui ON OFF)
		-DBUILD_OPENCL=$(usex opencl ON OFF)
		-DBUILD_OPENMP=$(usex openmp ON OFF)
		-DBUILD_TOOLS=$(usex tools ON OFF)
		-DBUILD_ZIQ=$(usex zstd ON OFF)
		-DBUILD_ZIQ2=$(usex ziq2 ON OFF)
		# Causes cmake errors during configure
		#-DUSE_VIDEO_ENCODER=$(usex ffmpeg ON OFF)
		-DPLUGIN_SIMD_NEON=$(usex cpu_flags_arm_neon ON OFF)
		# Fails to detect
		#-DPLUGIN_SIMD_AVX2=$(usex cpu_flags_x86_avx2 ON OFF)
		-DPLUGIN_SIMD_SSE41=$(usex cpu_flags_x86_sse4_1 ON OFF)
		-DPLUGIN_AIM=$(usex satdump_plugins_aim ON OFF)
		-DPLUGIN_AIRSPY_SDR_SUPPORT=$(usex satdump_plugins_airspy_sdr ON OFF)
		-DPLUGIN_ANALOG=$(usex satdump_plugins_analog ON OFF)
		-DPLUGIN_BLADERF_SDR_SUPPORT=$(usex satdump_plugins_bladerf_sdr ON OFF)
		-DPLUGIN_BLUEWALKER3=$(usex satdump_plugins_bluewalker3 ON OFF)
		-DPLUGIN_BOCHUM_SUPPORT=$(usex satdump_plugins_bochum ON OFF)
		-DPLUGIN_CLUSTER=$(usex satdump_plugins_cluster ON OFF)
		-DPLUGIN_CUBESAT=$(usex satdump_plugins_cubesat ON OFF)
		-DPLUGIN_DMSP=$(usex satdump_plugins_dmsp ON OFF)
		-DPLUGIN_DSCOVR=$(usex satdump_plugins_dscovr ON OFF)
		-DPLUGIN_DVB=$(usex satdump_plugins_dvb ON OFF)
		-DPLUGIN_ELEKTRO_ARKTIKA=$(usex satdump_plugins_elektro_arktika ON OFF)
		-DPLUGIN_EOS=$(usex satdump_plugins_eos ON OFF)
		-DPLUGIN_FY2=$(usex satdump_plugins_fy2 ON OFF)
		-DPLUGIN_FY3=$(usex satdump_plugins_fy3 ON OFF)
		-DPLUGIN_FY4=$(usex satdump_plugins_fy4 ON OFF)
		-DPLUGIN_GCOM=$(usex satdump_plugins_gcom ON OFF)
		-DPLUGIN_GEONETCAST=$(usex satdump_plugins_geonetcast ON OFF)
		-DPLUGIN_GK2A=$(usex satdump_plugins_gk2a ON OFF)
		-DPLUGIN_GOES=$(usex satdump_plugins_goes ON OFF)
		-DPLUGIN_GVAR_EXTENDED=$(usex satdump_plugins_gvar_extended ON OFF)
		-DPLUGIN_HACKRF_SDR_SUPPORT=$(usex satdump_plugins_hackrf_sdr ON OFF)
		-DPLUGIN_HIMAWARI=$(usex satdump_plugins_himawari ON OFF)
		-DPLUGIN_HINODE=$(usex satdump_plugins_hinode ON OFF)
		-DPLUGIN_INMARSAT=$(usex satdump_plugins_inmarsat ON OFF)
		-DPLUGIN_JASON3=$(usex satdump_plugins_jason3 ON OFF)
		-DPLUGIN_JPSS=$(usex satdump_plugins_jpss ON OFF)
		-DPLUGIN_LANDSAT=$(usex satdump_plugins_landsat ON OFF)
		-DPLUGIN_LIMESDR_SDR_SUPPORT=$(usex satdump_plugins_limesdr_sdr ON OFF)
		-DPLUGIN_MATS=$(usex satdump_plugins_mats ON OFF)
		-DPLUGIN_METEOR=$(usex satdump_plugins_meteor ON OFF)
		-DPLUGIN_MIRISDR_SDR_SUPPORT=$(usex satdump_plugins_mirisdr_sdr ON OFF)
		-DPLUGIN_NOAA_METOP=$(usex satdump_plugins_noaa_metop ON OFF)
		-DPLUGIN_NET_SOURCE_SDR_SUPPORT=$(usex satdump_plugins_net_source_sdr ON OFF)
		-DPLUGIN_OCEANSAT=$(usex satdump_plugins_oceansat ON OFF)
		-DPLUGIN_ORBCOMM=$(usex satdump_plugins_orbcomm ON OFF)
		-DPLUGIN_OTHERS=$(usex satdump_plugins_others ON OFF)
		-DPLUGIN_PLUTOSDR_SDR_SUPPORT=$(usex satdump_plugins_plutosdr_sdr ON OFF)
		-DPLUGIN_PORTAUDIO_SINK=$(usex satdump_plugins_portaudio_sink ON OFF)
		-DPLUGIN_PROBA=$(usex satdump_plugins_proba ON OFF)
		-DPLUGIN_REMOTE_SDR_SUPPORT=$(usex satdump_plugins_remote_sdr ON OFF)
		-DPLUGIN_RTAUDIO_SDR_SUPPORT=$(usex satdump_plugins_rtaudio_sdr ON OFF)
		-DPLUGIN_RTAUDIO_SINK=$(usex satdump_plugins_rtaudio_sink ON OFF)
		-DPLUGIN_RTLSDR_SDR_SUPPORT=$(usex satdump_plugins_rtlsdr_sdr ON OFF)
		-DPLUGIN_RTLTCP_SUPPORT=$(usex satdump_plugins_rtltcp ON OFF)
		-DPLUGIN_SCRIPTING=$(usex satdump_plugins_scripting ON OFF)
		-DPLUGIN_SDDC_SDR_SUPPORT=$(usex satdump_plugins_sddc_sdr ON OFF)
		-DPLUGIN_SDRPLAY_SDR_SUPPORT=$(usex satdump_plugins_sdrplay_sdr ON OFF)
		-DPLUGIN_SDRPP_SERVER_SUPPORT=$(usex satdump_plugins_sdrpp_server ON OFF)
		-DPLUGIN_SOAPY_SDR_SUPPORT=$(usex satdump_plugins_soapy_sdr ON OFF)
		-DPLUGIN_SPACEX=$(usex satdump_plugins_spacex ON OFF)
		-DPLUGIN_SPYSERVER_SUPPORT=$(usex satdump_plugins_spyserver ON OFF)
		-DPLUGIN_STANDARD_CPP_COMPOS=$(usex satdump_plugins_standard_cpp_compos ON OFF)
		-DPLUGIN_STEREO=$(usex satdump_plugins_stereo ON OFF)
		-DPLUGIN_TUBSAT=$(usex satdump_plugins_tubsat ON OFF)
		-DPLUGIN_UMKA=$(usex satdump_plugins_umka ON OFF)
		-DPLUGIN_USRP_SDR_SUPPORT=$(usex satdump_plugins_usrp_sdr ON OFF)
		-DPLUGIN_WSF=$(usex satdump_plugins_wsf ON OFF)
		# Dependencies not packaged
		-DPLUGIN_AARONIA_SDR_SUPPORT=OFF
		-DPLUGIN_AIRSPYHF_SDR_SUPPORT=OFF
		# Android only
		-DPLUGIN_AAUDIO_SINK=OFF
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	if [ "$(get_libdir)" != "lib" ]; then
		mv "${ED}/usr/lib" "${ED}/usr/$(get_libdir)" || die
	fi
}
