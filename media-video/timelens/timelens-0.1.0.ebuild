# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="aho-corasick-0.6.8
ansi_term-0.11.0
assert_cmd-0.9.1
assert_fs-0.9.0
atty-0.2.11
bitflags-1.0.4
cfg-if-0.1.5
clap-2.32.0
cloudabi-0.0.3
colored-1.6.1
crossbeam-0.3.2
difference-2.0.0
escargot-0.3.1
float-cmp-0.4.0
fnv-1.0.6
fuchsia-zircon-0.3.3
fuchsia-zircon-sys-0.3.3
glib-0.5.0
glib-sys-0.6.0
globset-0.4.1
globwalk-0.3.1
gobject-sys-0.6.0
gstreamer-0.11.6
gstreamer-app-0.11.2
gstreamer-app-sys-0.5.0
gstreamer-base-0.11.0
gstreamer-base-sys-0.5.0
gstreamer-sys-0.5.0
ignore-0.4.3
itoa-0.4.2
kernel32-sys-0.2.2
lazy_static-1.1.0
libc-0.2.43
log-0.4.5
memchr-2.0.2
muldiv-0.1.1
normalize-line-endings-0.2.2
num-integer-0.1.39
num-rational-0.1.42
num-traits-0.2.5
pkg-config-0.3.14
predicates-0.9.0
predicates-core-0.9.0
predicates-tree-0.9.0
proc-macro2-0.4.17
quote-0.6.8
rand-0.5.5
rand_core-0.2.1
redox_syscall-0.1.40
redox_termios-0.1.1
regex-1.0.4
regex-syntax-0.6.2
remove_dir_all-0.5.1
ryu-0.2.6
same-file-1.0.3
serde-1.0.76
serde_derive-1.0.76
serde_json-1.0.26
strsim-0.7.0
syn-0.14.9
tempfile-3.0.3
term_size-0.3.1
termion-1.5.1
textwrap-0.10.0
thread_local-0.3.6
treeline-0.1.0
ucd-util-0.1.1
unicode-width-0.1.5
unicode-xid-0.1.0
utf8-ranges-1.0.1
vec_map-0.8.1
version_check-0.1.4
walkdir-2.2.5
winapi-0.2.8
winapi-0.3.5
winapi-build-0.1.1
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.1
winapi-x86_64-pc-windows-gnu-0.4.0"

inherit cargo

DESCRIPTION="Timelens creates visual timelines from video files"
HOMEPAGE="https://timelens.io/"
SRC_URI="https://github.com/timelens/timelens/archive/${PV}.tar.gz -> ${P}.tar.gz
	$(cargo_crate_uris ${CRATES})"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

CDEPEND="media-libs/gstreamer:1.0
	dev-libs/glib:2"
DEPEND="${CDEPEND}"
RDEPEND="${RDEPEND} ${CDEPEND}"

DOCS=( CHANGELOG.md README.md )
