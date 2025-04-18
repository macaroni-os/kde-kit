# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="Logic-based symbol placement puzzle by KDE"
HOMEPAGE="https://apps.kde.org/en/ksudoku
https://games.kde.org/game.php?game=ksudoku"
LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS="*"
IUSE="opengl"

DEPEND="
	$(add_qt_dep qtgui)
	$(add_qt_dep qtprintsupport)
	$(add_qt_dep qtsvg)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtxml)
	$(add_kdeapps_dep libkdegames)
	$(add_frameworks_dep karchive)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kcrash)
	$(add_frameworks_dep kguiaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kjobwidgets)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kxmlgui)
	opengl? (
		$(add_qt_dep qtopengl)
		virtual/glu
	)
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package opengl Qt5OpenGL)
		$(cmake-utils_use_find_package opengl OpenGL)
	)
	kde5_src_configure
}