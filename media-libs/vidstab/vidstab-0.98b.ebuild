# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-multilib

DESCRIPTION="Video stabilization library"
HOMEPAGE="http://public.hronopik.de/vid.stab/"
SRC_URI="https://github.com/georgmartius/vid.stab/archive/release-${PV}.tar.gz -> vid.stab-${PV}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}/vid.stab-release-${PV}"
DOCS="Changelog README Todo Install"
