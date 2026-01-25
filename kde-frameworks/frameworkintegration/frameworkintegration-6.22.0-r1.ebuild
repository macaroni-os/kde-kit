# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Framework for integrating Qt applications with KDE Plasma workspaces"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/frameworkintegration-6.22.0.tar.xz -> frameworkintegration-6.22.0.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="dev-qt/qtbase:6[gui]
	kde-frameworks/kcolorscheme:6
	kde-frameworks/kconfig:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/knewstuff:6
	kde-frameworks/knotifications:6
	kde-frameworks/kwidgetsaddons:6
	
"
DEPEND="${RDEPEND}
	kde-frameworks/kpackage:6
	
"
src_prepare() {
	  kde6_src_prepare
}

src_configure() {
	  local mycmakeargs=(
	      -DCMAKE_DISABLE_FIND_PACKAGE_AppStreamQt=ON
	      -DCMAKE_DISABLE_FIND_PACKAGE_packagekitqt6=ON
	  )
	   kde6_src_configure
}


# vim: filetype=ebuild
