# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Framework providing assorted widgets for showing the progress of jobs"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/kjobwidgets-6.22.0.tar.xz -> kjobwidgets-6.22.0.tar.xz"
LICENSE="GPL-2"
SLOT="6"
KEYWORDS="*"
IUSE="X"
BDEPEND="dev-qt/qttools:6[linguist]
	
"
RDEPEND="virtual/kde-seed[gui,X?]
	kde-frameworks/kcoreaddons:6
	kde-frameworks/knotifications:6
	kde-frameworks/kwidgetsaddons:6
	
"
DEPEND="${RDEPEND}
"
src_configure() {
	local mycmakeargs=(
	  -DWITH_X11=$(usex X)
	  -DBUILD_PYTHON_BINDINGS=OFF
	  -DCMAKE_DISABLE_FIND_PACKAGE_{Python3,PySide6,Shiboken6}=ON
	)
	cmake_src_configure
}


# vim: filetype=ebuild
