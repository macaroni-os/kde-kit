# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Plasma screen management library"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/libkscreen-6.5.5.tar.xz -> libkscreen-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
BDEPEND=">=dev-libs/plasma-wayland-protocols-1.18.0
	dev-qt/qttools:6[linguist]
	dev-qt/qtbase:6[wayland]
	dev-util/wayland-scanner
	
"
RDEPEND="dev-libs/wayland
	dev-qt/qtbase:6[gui,wayland]
	kde-frameworks/kconfig:6
	x11-libs/libxcb:=
	
"
DEPEND="${RDEPEND}
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
