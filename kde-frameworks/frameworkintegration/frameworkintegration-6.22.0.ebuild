# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Framework for integrating Qt applications with KDE Plasma workspaces"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/frameworkintegration-6.22.0.tar.xz -> frameworkintegration-6.22.0.tar.xz"
LICENSE="GPL-2"
SLOT="6"
KEYWORDS="*"
RDEPEND="virtual/kde-seed[gui]
	kde-frameworks/kcolorscheme:6
	kde-frameworks/kconfig:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/knewstuff:6
	kde-frameworks/knotifications:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kpackage:6
	
"
DEPEND="${RDEPEND}
"
src_configure() {
	local mycmakeargs=(
	    -DCMAKE_DISABLE_FIND_PACKAGE_AppStreamQt=ON
	    -DCMAKE_DISABLE_FIND_PACKAGE_packagekitqt6=ON
	)
	cmake_src_configure
}


# vim: filetype=ebuild
