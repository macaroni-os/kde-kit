# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Tools to configure LXQt and the underlying operating system"
HOMEPAGE="https://lxqt-project.org"
SRC_URI="https://api.github.com/repos/lxqt/lxqt-config/tarball/2.3.2 -> lxqt-config-2.3.2-0f240b5.tar.gz"
LICENSE="GPL-2 GPL-2+ GPL-3 LGPL-2 LGPL-2+ LGPL-2.1+ WTFPL-2"
SLOT="0"
KEYWORDS="*"
IUSE="+monitor +touchpad"
RDEPEND="dev-libs/libqtxdg
	dev-qt/qtbase:6[gui]
	dev-qt/qtsvg:6
	lxqt-base/liblxqt
	lxqt-base/lxqt-menu-data
	sys-libs/zlib
	x11-apps/setxkbmap
	x11-libs/libxcb
	x11-libs/libX11
	x11-libs/libXcursor
	x11-libs/libXfixes
	monitor? ( kde-plasma/libkscreen:6 )
	touchpad? (
	    virtual/libudev
	    x11-drivers/xf86-input-libinput
	    x11-libs/libXi
	)
	
"
DEPEND="${RDEPEND}
	dev-util/lxqt-build-tools
	dev-qt/qttools:6[linguist]
	
"

post_src_unpack() {
	mv lxqt-lxqt-config-* ${S}
}


src_configure() {
	  local mycmakeargs=(
	      -DWITH_MONITOR=$(usex monitor)
	      -DWITH_TOUCHPAD=$(usex touchpad)
	  )
	  cmake_src_configure
}
src_install() {
	  cmake_src_install
	  doman man/*.1 liblxqt-config-cursor/man/*.1 lxqt-config-appearance/man/*.1
}



# vim: filetype=ebuild
