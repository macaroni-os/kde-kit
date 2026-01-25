# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Library for embedding KParts in a Kontact component"
HOMEPAGE="https://api.kde.org/kdepim/kontactinterface/html/index.html"
SRC_URI="https://download.kde.org/stable/release-service/25.12.1/src/kontactinterface-25.12.1.tar.xz -> kontactinterface-25.12.1.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="dev-qt/qtbase:6=[gui,X]
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kio:6
	kde-frameworks/kparts:6
	kde-frameworks/kwindowsystem:6[X]
	kde-frameworks/kxmlgui:6
	
"
DEPEND="${RDEPEND}
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
