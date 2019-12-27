# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

CRATES="aho-corasick-0.6.9
ansi_term-0.11.0
assert_cmd-0.11.0
assert_fs-0.11.3
atty-0.2.11
autocfg-0.1.2
bitflags-1.0.4
cfg-if-0.1.6
clap-2.32.0
cloudabi-0.0.3
colored-1.7.0
crossbeam-channel-0.3.8
crossbeam-utils-0.6.5
difference-2.0.0
escargot-0.4.0
float-cmp-0.4.0
fnv-1.0.6
fuchsia-cprng-0.1.1
glib-0.6.1
glib-sys-0.7.0
globset-0.4.2
globwalk-0.5.0
gobject-sys-0.7.0
gstreamer-0.12.2
gstreamer-app-0.12.2
gstreamer-app-sys-0.6.2
gstreamer-base-0.12.2
gstreamer-base-sys-0.6.2
gstreamer-sys-0.6.2
ignore-0.4.6
itoa-0.4.3
kernel32-sys-0.2.2
lazy_static-1.2.0
libc-0.2.48
log-0.4.6
memchr-2.1.3
muldiv-0.2.0
normalize-line-endings-0.2.2
num-integer-0.1.39
num-rational-0.2.1
num-traits-0.2.6
pkg-config-0.3.14
predicates-1.0.0
predicates-core-1.0.0
predicates-tree-1.0.0
proc-macro2-0.4.27
quote-0.6.11
rand-0.6.5
rand_chacha-0.1.1
rand_core-0.3.1
rand_core-0.4.0
rand_hc-0.1.0
rand_isaac-0.1.1
rand_jitter-0.1.2
rand_os-0.1.2
rand_pcg-0.1.1
rand_xorshift-0.1.1
rdrand-0.4.0
redox_syscall-0.1.51
redox_termios-0.1.1
regex-1.1.0
regex-syntax-0.6.5
remove_dir_all-0.5.1
rustc_version-0.2.3
ryu-0.2.7
same-file-1.0.4
semver-0.9.0
semver-parser-0.7.0
serde-1.0.87
serde_derive-1.0.87
serde_json-1.0.38
smallvec-0.6.8
strsim-0.7.0
syn-0.15.26
tempfile-3.0.5
term_size-0.3.1
termion-1.5.1
textwrap-0.10.0
thread_local-0.3.6
treeline-0.1.0
ucd-util-0.1.3
unicode-width-0.1.5
unicode-xid-0.1.0
unreachable-1.0.0
utf8-ranges-1.0.2
vec_map-0.8.1
void-1.0.2
walkdir-2.2.7
winapi-0.2.8
winapi-0.3.6
winapi-build-0.1.1
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.2
winapi-x86_64-pc-windows-gnu-0.4.0"

DESCRIPTION="Timelens creates visual timelines from video files"
HOMEPAGE="https://timelens.io/"
SRC_URI="https://github.com/timelens/timelens/archive/${PV}.tar.gz -> ${P}.tar.gz
	$(cargo_crate_uris ${CRATES})"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="media-libs/gstreamer:1.0
	dev-libs/glib:2"
RDEPEND="${DEPEND}"

DOCS=( CHANGELOG.md README.md )
