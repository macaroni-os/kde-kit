# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="The LXQt session manager"
HOMEPAGE="https://lxqt-project.org"
SRC_URI="https://api.github.com/repos/lxqt/lxqt-session/tarball/2.3.0 -> lxqt-session-2.3.0-d6b1939.tar.gz"
LICENSE="LGPL-2.1 LGPL-2.1+"
SLOT="0"
KEYWORDS="*"
IUSE="+udev"
RDEPEND="app-misc/qtxdg-tools
	dev-libs/libqtxdg
	dev-qt/qtbase:6[gui]
	kde-frameworks/kwindowsystem:6[X]
	kde-plasma/layer-shell-qt:6
	lxqt-base/liblxqt
	sys-process/procps
	x11-libs/libX11
	x11-misc/xdg-user-dirs
	udev? ( virtual/libudev )
	
"
DEPEND="${RDEPEND}
	dev-util/lxqt-build-tools
	dev-qt/qttools:6[linguist]
	
"

post_src_unpack() {
	mv lxqt-lxqt-session-* ${S}
}


src_configure() {
	  local mycmakeargs=(
	      -DWITH_LIBUDEV=$(usex udev)
	  )
	  cmake_src_configure
}
src_install() {
	cmake_src_install
	doman lxqt-config-session/man/*.1 lxqt-session/man/*.1
	doenvd "${FILESDIR}"/91lxqt-config-dir
}



# vim: filetype=ebuild
