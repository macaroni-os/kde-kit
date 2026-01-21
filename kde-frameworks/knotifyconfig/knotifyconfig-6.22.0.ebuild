# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Framework for configuring desktop notifications"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/knotifyconfig-6.22.0.tar.xz -> knotifyconfig-6.22.0.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="dev-qt/qtbase:6[gui]
	dev-qt/qtmultimedia:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	
"
DEPEND="${RDEPEND}
	
"
src_configure() {
	  local mycmakeargs=(
	      -DCMAKE_DISABLE_FIND_PACKAGE_Canberra=ON
	  )
	  kde6_src_configure
}


# vim: filetype=ebuild
