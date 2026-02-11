# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Library for interfacing with calendars"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/kcalendarcore-6.22.0.tar.xz -> kcalendarcore-6.22.0.tar.xz"
LICENSE="GPL-2"
SLOT="6"
KEYWORDS="*"
RDEPEND="virtual/kde-seed[gui,declarative]
	>=dev-libs/libical-3.0.5:=
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
