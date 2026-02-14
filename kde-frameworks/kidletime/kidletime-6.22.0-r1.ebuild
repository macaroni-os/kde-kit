# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Framework for detection and notification of device idle time"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/kidletime-6.22.0.tar.xz -> kidletime-6.22.0.tar.xz"
LICENSE="GPL-2"
SLOT="6"
KEYWORDS="*"
IUSE="wayland X xscreensaver"
REQUIRED_USE="xscreensaver? ( X )"
RDEPEND="virtual/kde-seed[gui,wayland?,X?]
	X? (
	    x11-libs/libX11
	    x11-libs/libxcb
	    x11-libs/libXext
	)
	xscreensaver? (
	    x11-libs/libXScrnSaver
	)
	
"
DEPEND="${RDEPEND}
	wayland? (
	  >=dev-libs/plasma-wayland-protocols-1.11.1
	  >=dev-libs/wayland-protocols-1.27:0
	)
	
"
src_prepare() {
	cmake_src_prepare
	if ! use xscreensaver; then
	  sed -i -e "s/\${X11_Xscreensaver_FOUND}/0/" CMakeLists.txt || die
	fi
}
src_configure() {
	local mycmakeargs=(
	  -DWITH_WAYLAND=$(usex wayland)
	  -DWITH_X11=$(usex X)
	)
	cmake_src_configure
}


# vim: filetype=ebuild
