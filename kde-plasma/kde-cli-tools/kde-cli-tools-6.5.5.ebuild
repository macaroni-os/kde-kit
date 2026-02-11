# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Tools based on KDE Frameworks 6 to better interact with the system"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/kde-cli-tools-6.5.5.tar.xz -> kde-cli-tools-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="kdesu X"
BDEPEND="kde-frameworks/kcmutils:6
	
"
RDEPEND="virtual/kde-seed[gui,svg,X?]
	kdesu? ( >=${CATEGORY}/kdesu-gui-${PV} )
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kparts:6
	kde-frameworks/kservice:6
	
"
DEPEND="${RDEPEND}
"
src_prepare() {
	cmake_src_prepare
	cmake_comment_add_subdirectory keditfiletype # split package
}
src_configure() {
	local mycmakeargs=(
	  -DCMAKE_DISABLE_FIND_PACKAGE_KF6Su=ON
	  -DWITH_X11=$(usex X)
	)
	cmake_src_configure
}


# vim: filetype=ebuild
