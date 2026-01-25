# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Tools based on KDE Frameworks 6 to better interact with the system"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/kde-cli-tools-6.5.5.tar.xz -> kde-cli-tools-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="kdesu X"
BDEPEND="kde-frameworks/kcmutils:6
	
"
RDEPEND="kdesu? ( >=${CATEGORY}/kdesu-gui-${PV} )
	
"
DEPEND="${RDEPEND}
	dev-qt/qtbase:6[gui]
	dev-qt/qtsvg:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kparts:6
	kde-frameworks/kservice:6
	X? ( dev-qt/qtbase:6[gui,X] )
	
"
src_prepare() {
	  kde6_src_prepare
	  ecm_punt_po_install
	  cmake_comment_add_subdirectory keditfiletype # split package
}

src_configure() {
	  local mycmakeargs=(
	      -DCMAKE_DISABLE_FIND_PACKAGE_KF6Su=ON
	      -DWITH_X11=$(usex X)
	  )
	  kde6_src_configure
}


# vim: filetype=ebuild
