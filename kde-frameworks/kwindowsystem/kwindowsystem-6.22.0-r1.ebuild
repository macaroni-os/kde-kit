# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Framework providing access to properties and features of the window manager"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/kwindowsystem-6.22.0.tar.xz -> kwindowsystem-6.22.0.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="wayland X"
BDEPEND="dev-qt/qttools:6[linguist]
	
"
RDEPEND="dev-qt/qtbase:6[gui]
	dev-qt/qtdeclarative:6
	wayland? ( dev-qt/qtbase:6[wayland] )
	X? (
	    dev-qt/qtbase:6[gui,X]
	    x11-base/xorg-proto
	    x11-libs/libX11
	    x11-libs/libXfixes
	    x11-libs/libxcb
	    x11-libs/xcb-util-keysyms
	)
	wayland? ( || ( >=dev-qt/qtbase-6.10:6[wayland] <dev-qt/qtwayland-6.10:6 ) )
	
"
DEPEND="${RDEPEND}
	test? ( dev-qt/qtbase:6 )
	wayland? (
	    dev-libs/plasma-wayland-protocols
	    >=dev-libs/wayland-protocols-1.21
	)
	
"
src_prepare() {
	  kde6_src_prepare
}

src_configure() {
	  local mycmakeargs=(
	      -DKWINDOWSYSTEM_WAYLAND=$(usex wayland)
	      -DKWINDOWSYSTEM_X11=$(usex X)
	  )
	   kde6_src_configure
}


# vim: filetype=ebuild
