# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop kde5

DESCRIPTION="KDE multimedia abstraction library"
HOMEPAGE="https://community.kde.org/Phonon"
SRC_URI="mirror://kde/stable/phonon/${PV}/${P}.tar.xz"

LICENSE="|| ( LGPL-2.1 LGPL-3 ) !pulseaudio? ( || ( GPL-2 GPL-3 ) )"
SLOT="0"
KEYWORDS="*"
IUSE="debug designer gstreamer pulseaudio +vlc"

BDEPEND="
	$(add_qt_dep linguist-tools)
	virtual/pkgconfig
"
DEPEND="
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	designer? ( $(add_qt_dep designer) )
	pulseaudio? (
		dev-libs/glib:2
		media-sound/pulseaudio[glib]
	)
"
RDEPEND="${DEPEND}"
PDEPEND="
	gstreamer? ( >=media-libs/phonon-gstreamer-4.9.60 )
	vlc? ( >=media-libs/phonon-vlc-0.9.60 )
"

src_configure() {
	local mycmakeargs=(
		-DPHONON_BUILD_DESIGNER_PLUGIN=$(usex designer)
		-DCMAKE_DISABLE_FIND_PACKAGE_GLIB2=$(usex !pulseaudio)
		-DCMAKE_DISABLE_FIND_PACKAGE_PulseAudio=$(usex !pulseaudio)
		-DPHONON_BUILD_SETTINGS=ON
	)
	kde5_src_configure
}

src_install() {
	kde5_src_install
	make_desktop_entry "${PN}settings" \
		"Phonon Audio and Video" preferences-desktop-sound
}
