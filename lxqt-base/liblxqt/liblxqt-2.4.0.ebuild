# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Core utility library for all LXQt components"
HOMEPAGE="https://lxqt-project.org"
SRC_URI="https://api.github.com/repos/lxqt/liblxqt/tarball/2.4.0 -> liblxqt-2.4.0-d72a647.tar.gz"
LICENSE="LGPL-2.1+ BSD"
SLOT="0"
KEYWORDS="*"
IUSE="+backlight"
RDEPEND="dev-libs/libqtxdg
	dev-qt/qtbase:6[gui]
	kde-frameworks/kwindowsystem:6[X]
	x11-libs/libX11
	x11-libs/libXScrnSaver
	backlight? ( >=sys-auth/polkit-qt-0.200.0[qt6] )
	
"
DEPEND="${RDEPEND}
	dev-util/lxqt-build-tools
	dev-qt/qttools:6[linguist]
	
"

post_src_unpack() {
	mv lxqt-liblxqt-* ${S}
}


src_configure() {
	      local mycmakeargs=(
	              -DBUILD_BACKLIGHT_LINUX_BACKEND=$(usex backlight)
	      )
	      cmake_src_configure
}



# vim: filetype=ebuild
