# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Qt-style client and server library wrapper for Wayland libraries"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/kwayland-6.5.5.tar.xz -> kwayland-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
BDEPEND=">=dev-libs/plasma-wayland-protocols-1.18.0
	>=dev-libs/wayland-protocols-1.34
	dev-util/wayland-scanner
	
"
RDEPEND="virtual/kde-seed[gui,wayland]
	media-libs/libepoxy
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
