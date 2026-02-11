# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Framework for managing menu and toolbar actions in an abstract way"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/kxmlgui-6.22.0.tar.xz -> kxmlgui-6.22.0.tar.xz"
LICENSE="GPL-2"
SLOT="6"
KEYWORDS="*"
RDEPEND="virtual/kde-seed[gui]
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kglobalaccel:6
	kde-frameworks/kguiaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kitemviews:6
	kde-frameworks/kwidgetsaddons:6
	
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
