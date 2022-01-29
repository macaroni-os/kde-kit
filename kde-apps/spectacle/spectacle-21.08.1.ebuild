# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
KDE_TEST="forceoptional"
FRAMEWORKS_MINIMAL=5.75.0
QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="Screenshot capture utility"
HOMEPAGE="https://apps.kde.org/en/spectacle"
LICENSE="LGPL-2+ handbook? ( FDL-1.3 ) kipi? ( GPL-2+ )"
SLOT="5"
KEYWORDS="*"
IUSE="+annotate kipi share"

# TODO: Qt5Svg leaking from media-libs/kimageannotator
DEPEND="
	$(add_qt_dep qdbus)
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtsvg)
	$(add_qt_dep qtprintsupport)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtx11extras)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep kglobalaccel)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep knewstuff)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep kwayland)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kwindowsystem)
	$(add_frameworks_dep kxmlgui)
	x11-libs/libxcb
	x11-libs/xcb-util
	x11-libs/xcb-util-cursor
	x11-libs/xcb-util-image
	annotate? ( media-libs/kimageannotator )
	kipi? ( $(add_kdeapps_dep libkipi) )
	share? ( $(add_frameworks_dep purpose) )
"
RDEPEND="${DEPEND}
	kipi? ( $(add_kdeapps_dep kipi-plugins) )
"

src_prepare() {
	kde5_src_prepare
	# Unnecessary with >=media-libs/kimageannotator-0.4.0
	sed -e "/find_package\s*(\s*X11/d" -e "/find_package\s*(\s*kColorPicker/d" \
		-i CMakeLists.txt || die
}

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package annotate kImageAnnotator)
		$(cmake-utils_use_find_package kipi KF5Kipi)
		$(cmake-utils_use_find_package share KF5Purpose)
	)
	kde5_src_configure
}