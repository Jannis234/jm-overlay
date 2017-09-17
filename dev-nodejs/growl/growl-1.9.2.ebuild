# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit node-module

DESCRIPTION="Growl unobtrusive notifications"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

# Doesn't verify if the tests succeeded
# Needs to run inside a desktop session to do anything (relies on notify-send)
RESTRICT="test"

DOCS=( Readme.md History.md )
