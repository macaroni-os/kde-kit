# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Plasma screen management library"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/libkscreen-6.5.5.tar.xz -> libkscreen-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="wayland"
BDEPEND="kde-frameworks/kconfig:6
	dev-qt/qttools:6[linguist]
	wayland? (
	  dev-libs/plasma-wayland-protocols
	  dev-util/wayland-scanner
	)
	
"
RDEPEND="virtual/kde-seed[gui,wayland?]
	x11-libs/libxcb:=
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
