# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Provides integration plugins for various KDE frameworks for Wayland"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/kwayland-integration-6.5.5.tar.xz -> kwayland-integration-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="dev-qt/qtbase:6[gui,wayland]
	dev-qt/qtwayland:6
	kde-frameworks/kguiaddons:6[wayland]
	kde-frameworks/kidletime:6[wayland]
	kde-frameworks/knotifications:6
	kde-frameworks/kservice:6
	kde-frameworks/kstatusnotifieritem:6
	kde-frameworks/kwindowsystem:6[wayland]
	kde-plasma/kwayland:6
	media-libs/libepoxy
	
"
DEPEND="${RDEPEND}
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
