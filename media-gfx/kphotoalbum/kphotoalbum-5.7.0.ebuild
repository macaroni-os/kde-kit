# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
FRAMEWORKS_MINIMAL=5.60.0
QT_MINIMAL=5.12.3
inherit kde5

DESCRIPTION="Tool for indexing, searching, and viewing images"
HOMEPAGE="https://www.kphotoalbum.org/"
SRC_URI="mirror://kde/stable/${PN}/${PV}/${P}.tar.xz"

LICENSE="GPL-2+ FDL-1.2"
SLOT="5"
KEYWORDS="*"
IUSE="map +raw share"

DEPEND="
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtsql sqlite)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtxml)
	$(add_frameworks_dep karchive)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kjobwidgets)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep ktextwidgets)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kxmlgui)
	media-gfx/exiv2:=
	media-libs/phonon[qt5(+)]
	virtual/jpeg:0
	map? ( kde-apps/marble:5 )
	raw? ( kde-apps/libkdcraw:5 )
	share? ( $(add_frameworks_dep kxmlgui) )
"
RDEPEND="${DEPEND}
	media-video/ffmpeg
"

DOCS=( ChangeLog README.md )

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package map Marble)
		$(cmake-utils_use_find_package raw KF5KDcraw)
		$(cmake-utils_use_find_package share KF5Purpose)
	)

	kde5_src_configure
}
