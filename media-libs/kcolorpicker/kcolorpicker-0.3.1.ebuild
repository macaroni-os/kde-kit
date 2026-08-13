# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Qt based color picker with popup menu"
HOMEPAGE="https://github.com/ksnip/kColorPicker"
SRC_URI="https://github.com/ksnip/kColorPicker/archive/v0.3.1.tar.gz -> kColorPicker-0.3.1.tar.gz"
LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="*"
IUSE="qt5 +qt6"
REQUIRED_USE="^^ ( qt5 qt6 )"
RDEPEND="qt5? (
	  dev-qt/qtcore:5
	  dev-qt/qtgui:5
	  dev-qt/qtwidgets:5
	)
	qt6? ( dev-qt/qtbase:6[gui] )
	
"
DEPEND="${RDEPEND}
"
S="${WORKDIR}/kColorPicker-0.3.1"
src_configure() {
	local mycmakeargs=(
	  -DBUILD_SHARED_LIBS=ON
	  -DBUILD_WITH_QT6=$(usex qt6)
	  -DBUILD_EXAMPLE=OFF
	  -DBUILD_TESTS=OFF
	)
	cmake_src_configure
}


# vim: filetype=ebuild
