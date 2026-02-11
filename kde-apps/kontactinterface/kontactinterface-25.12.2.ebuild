# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Library for embedding KParts in a Kontact component"
HOMEPAGE="https://api.kde.org/kdepim/kontactinterface/html/index.html"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kontactinterface-25.12.2.tar.xz -> kontactinterface-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="virtual/kde-seed[gui,X]
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kio:6
	kde-frameworks/kparts:6
	kde-frameworks/kwindowsystem:6[X]
	kde-frameworks/kxmlgui:6
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
