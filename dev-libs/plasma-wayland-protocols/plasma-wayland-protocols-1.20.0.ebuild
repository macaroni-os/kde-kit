# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Plasma Specific Protocols for Wayland"
HOMEPAGE="https://invent.kde.org/libraries/plasma-wayland-protocols"
SRC_URI="https://download.kde.org/stable/plasma-wayland-protocols/plasma-wayland-protocols-1.20.0.tar.xz -> plasma-wayland-protocols-1.20.0.tar.xz"
LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="*"
BDEPEND="dev-libs/libpcre2:*
	dev-qt/qtbase:6
	>=kde-frameworks/extra-cmake-modules-6.0:*
	
"
src_configure() {
	local mycmakeargs=(
	  -DQT_MAJOR_VERSION=6
	  -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
	  -DKDE_INSTALL_DOCBUNDLEDIR="${EPREFIX}/usr/share/help"
	  -DBUILD_TESTING=OFF
	)
	 cmake_src_configure
}


# vim: filetype=ebuild
