# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake xdg

DESCRIPTION="Framework for solving common problems such as caching, randomisation, and more"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/kcoreaddons-6.22.0.tar.xz -> kcoreaddons-6.22.0.tar.xz"
LICENSE="GPL-2"
SLOT="6"
KEYWORDS="*"
IUSE="dbus"
RDEPEND="virtual/kde-seed[declarative]
	dev-qt/qttranslations:6
	dev-qt/qttools:6[linguist]
	virtual/libudev:=
	
"
DEPEND="${RDEPEND}
	sys-kernel/linux-headers
	
"
src_prepare() {
	cmake_src_prepare
}
src_configure() {
	local mycmakeargs=(
	    -DKCOREADDONS_USE_QML=ON
	    -DENABLE_INOTIFY=ON
	    -DUSE_DBUS=$(usex dbus)
	    -DBUILD_PYTHON_BINDINGS=OFF
	    -DCMAKE_DISABLE_FIND_PACKAGE_{Python3,PySide6,Shiboken6}=ON
	)
	cmake_src_configure
}


# vim: filetype=ebuild
