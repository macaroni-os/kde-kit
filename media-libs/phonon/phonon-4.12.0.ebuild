# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake desktop flag-o-matic

DESCRIPTION="KDE multimedia abstraction library"
HOMEPAGE="https://community.kde.org/Phonon"
SRC_URI="https://download.kde.org/stable/phonon/4.12.0/phonon-4.12.0.tar.xz -> phonon-4.12.0.tar.xz"
LICENSE="|| ( LGPL-2.1 LGPL-3 ) !pulseaudio? ( || ( GPL-2 GPL-3 ) )"
SLOT="0"
KEYWORDS="*"
IUSE="debug designer pulseaudio +vlc"
BDEPEND="dev-libs/libpcre2:*
	dev-qt/qttools:6[linguist]
	>=kde-frameworks/extra-cmake-modules-5.115.0:*
	virtual/pkgconfig
	
"
RDEPEND="dev-qt/qt5compat:6
	dev-qt/qtbase:[{ .Values.qt_slot }}[gui]
	designer? ( dev-qt/qttools:6[designer] )
	pulseaudio? (
	  dev-libs/glib:2
	  media-sound/pulseaudio[glib]
	)
	!media-libs/phonon-gstreamer
	|| (
	  kde-frameworks/breeze-icons:6
	  kde-frameworks/oxygen-icons:*
	)
	
"
DEPEND="${RDEPEND}
"
PDEPEND="vlc? ( >=media-libs/phonon-vlc-0.12.0 )
	
"
src_configure() {
	use debug || append-cppflags -DQT_NO_DEBUG
	 local mycmakeargs=(
	  -DQT_MAJOR_VERSION=6
	  -DPHONON_BUILD_QT5=OFF
	  -DPHONON_BUILD_QT6=ON
	  -DPHONON_BUILD_SETTINGS=ON
	  -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
	  -DKDE_INSTALL_DOCBUNDLEDIR="${EPREFIX}/usr/share/help"
	  -DPHONON_BUILD_DESIGNER_PLUGIN=$(usex designer)
	  -DCMAKE_DISABLE_FIND_PACKAGE_GLIB2=$(usex !pulseaudio)
	  -DCMAKE_DISABLE_FIND_PACKAGE_PulseAudio=$(usex !pulseaudio)
	)
	 # Use make instead of ninja to avoid multiple outputs issue
	export CMAKE_MAKEFILE_GENERATOR=emake
	cmake_src_configure
}

src_install() {
	cmake_src_install
	make_desktop_entry "${PN}settings" \
	  "Phonon Audio and Video" preferences-desktop-sound
}


# vim: filetype=ebuild
