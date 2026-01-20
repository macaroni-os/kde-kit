# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Qt-style client and server library wrapper for Wayland libraries"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/kwayland-6.5.5.tar.xz -> kwayland-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
BDEPEND=">=dev-libs/plasma-wayland-protocols-1.18.0
	>=dev-libs/wayland-protocols-1.34
	dev-util/wayland-scanner
	
"
RDEPEND=">=dev-libs/wayland-1.15.0
	dev-qt/qtbase:6[gui,wayland]
	dev-qt/qtwayland:6
	media-libs/libepoxy
	
"
DEPEND="${RDEPEND}
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
