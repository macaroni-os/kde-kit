# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Framework providing access to properties and features of the window manager"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/kwindowsystem-6.22.0.tar.xz -> kwindowsystem-6.22.0.tar.xz"
LICENSE="GPL-2"
SLOT="6"
KEYWORDS="*"
IUSE="wayland X"
BDEPEND="dev-qt/qttools:6[linguist]
	
"
RDEPEND="virtual/kde-seed[gui,declarative,wayland?,X?]
	X? (
	  x11-libs/libX11
	  x11-libs/libXfixes
	  x11-libs/libxcb
	  x11-libs/xcb-util-keysyms
	)
	
"
DEPEND="${RDEPEND}
	X? (
	  x11-base/xorg-proto
	)
	wayland? (
	    dev-libs/plasma-wayland-protocols
	    >=dev-libs/wayland-protocols-1.21
	)
	
"
src_configure() {
	local mycmakeargs=(
	  -DKWINDOWSYSTEM_WAYLAND=$(usex wayland)
	  -DKWINDOWSYSTEM_X11=$(usex X)
	)
	cmake_src_configure
}


# vim: filetype=ebuild
