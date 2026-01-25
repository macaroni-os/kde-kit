# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Framework providing assorted high-level user interface components"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/kguiaddons-6.22.0.tar.xz -> kguiaddons-6.22.0.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="dbus wayland X"
BDEPEND="wayland? (
	    dev-qt/qtbase:6[wayland]
	    dev-util/wayland-scanner
	    || ( >=dev-qt/qtbase-6.10:6[wayland] <dev-qt/qtwayland-6.10:6 )
	)
	
"
RDEPEND="!<kde-frameworks/kguiaddons-5.116.0-r2:5[-kf6compat(-)]
	wayland? ( || ( >=dev-qt/qtbase-6.10:6[wayland] <dev-qt/qtwayland-6.10:6 ) )
	
"
DEPEND="${RDEPEND}
	dev-qt/qtbase:6[gui]
	dev-qt/qtdeclarative:6
	wayland? (
	    dev-libs/wayland
	    dev-qt/qtbase:6=[wayland]
	    >=dev-libs/plasma-wayland-protocols-1.15.0
	    >=dev-libs/wayland-protocols-1.39
	)
	X? (
	    dev-qt/qtbase:6[X]
	    x11-libs/libX11
	    x11-base/xorg-proto
	    x11-libs/libxcb
	)
	
"
src_prepare() {
	  kde6_src_prepare
}

src_configure() {
	  local mycmakeargs=(
	      -DBUILD_GEO_SCHEME_HANDLER=ON
	      -DUSE_DBUS=$(usex dbus)
	      -DWITH_WAYLAND=$(usex wayland)
	      -DWITH_X11=$(usex X)
	      -DBUILD_PYTHON_BINDINGS=OFF
	      -DCMAKE_DISABLE_FIND_PACKAGE_{Python3,PySide6,Shiboken6}=ON
	  )
	  kde6_src_configure
}


# vim: filetype=ebuild
