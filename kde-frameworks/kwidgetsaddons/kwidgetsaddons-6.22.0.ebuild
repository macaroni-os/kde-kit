# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="An assortment of high-level widgets for common tasks"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/kwidgetsaddons-6.22.0.tar.xz -> kwidgetsaddons-6.22.0.tar.xz"
LICENSE="GPL-2"
SLOT="6"
KEYWORDS="*"
BDEPEND="dev-qt/qttools:6[linguist]
	
"
RDEPEND="virtual/kde-seed[gui]
	
"
DEPEND="${RDEPEND}
"
src_configure() {
	local mycmakeargs=(
	  -DBUILD_PYTHON_BINDINGS=OFF
	  -DCMAKE_DISABLE_FIND_PACKAGE_{Python3,PySide6,Shiboken6}=ON
	)
	cmake_src_configure
}


# vim: filetype=ebuild
