# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake flag-o-matic

DESCRIPTION="VLC backend for the Phonon multimedia library"
HOMEPAGE="https://community.kde.org/Phonon"
SRC_URI="https://download.kde.org/stable/phonon/phonon-backend-vlc//0.12.0/phonon-backend-vlc-0.12.0.tar.xz -> phonon-backend-vlc-0.12.0.tar.xz"
LICENSE="LGPL-2.1+ || ( LGPL-2.1 LGPL-3 )"
SLOT="0"
KEYWORDS="*"
IUSE="debug"
BDEPEND="dev-libs/libpcre2:*
	dev-qt/qttools:6[linguist]
	>=kde-frameworks/extra-cmake-modules-5.115.0:*
	virtual/pkgconfig
	
"
RDEPEND="${DEPEND}
"
DEPEND="dev-qt/qtbase:6[gui]
	>=media-libs/phonon-4.12.0
	media-video/vlc:=[dbus,ogg,vorbis(+)]
	
"
S="${WORKDIR}/phonon-backend-vlc-0.12.0"
src_configure() {
	use debug || append-cppflags -DQT_NO_DEBUG
	 local mycmakeargs=(
	  -DQT_MAJOR_VERSION=6
	  -DPHONON_BUILD_QT5=OFF
	  -DPHONON_BUILD_QT6=ON
	  -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
	  -DKDE_INSTALL_DOCBUNDLEDIR="${EPREFIX}/usr/share/help"
	)
	cmake_src_configure
}


# vim: filetype=ebuild
