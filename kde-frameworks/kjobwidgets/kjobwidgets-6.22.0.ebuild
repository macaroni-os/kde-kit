# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Framework providing assorted widgets for showing the progress of jobs"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/kjobwidgets-6.22.0.tar.xz -> kjobwidgets-6.22.0.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="X"
BDEPEND="dev-qt/qttools:6[linguist]
	
"
RDEPEND="dev-qt/qtbase:6[gui]
	kde-frameworks/kcoreaddons:6
	kde-frameworks/knotifications:6
	kde-frameworks/kwidgetsaddons:6
	X? ( dev-qt/qtbase:6[X] )
	
"
DEPEND="${RDEPEND}
	
"
src_configure() {
	  local mycmakeargs=(
	      -DWITH_X11=$(usex X)
	      -DBUILD_PYTHON_BINDINGS=OFF
	      -DCMAKE_DISABLE_FIND_PACKAGE_{Python3,PySide6,Shiboken6}=ON
	  )
	  kde6_src_configure
}


# vim: filetype=ebuild
