# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Library for interfacing with calendars"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/kcalendarcore-6.22.0.tar.xz -> kcalendarcore-6.22.0.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND=">=dev-libs/libical-3.0.5:=
	dev-qt/qtbase:6[gui]
	dev-qt/qtdeclarative:6
	
"
DEPEND="${RDEPEND}
	
"

# vim: filetype=ebuild
