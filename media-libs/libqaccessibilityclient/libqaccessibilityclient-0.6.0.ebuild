# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Accessibilty tools helper library, used e.g. by screen readers"
HOMEPAGE="https://invent.kde.org/libraries/libqaccessibilityclient"
SRC_URI="https://download.kde.org/Attic/libqaccessibilityclient/libqaccessibilityclient-0.6.0.tar.xz -> libqaccessibilityclient-0.6.0.tar.xz"
LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="*"
IUSE="qt5 +qt6"
REQUIRED_USE="|| ( qt5 qt6 )"
BDEPEND="virtual/pkgconfig
"
RDEPEND="qt5? (
	  dev-qt/qtdbus:5
	  dev-qt/qtgui:5
	  dev-qt/qtwidgets:5
	)
	qt6? ( dev-qt/qtbase:6[gui] )
	
"
DEPEND="${RDEPEND}
"
src_configure() {
	local mycmakeargs=(
	  -DQT_MAJOR_VERSION=$(usex qt6 6 5)
	)
	cmake_src_configure
}


# vim: filetype=ebuild
