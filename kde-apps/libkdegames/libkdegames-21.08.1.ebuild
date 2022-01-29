# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="forceoptional"
FRAMEWORKS_MINIMAL=5.75.0
QT_MINIMAL=5.15.1
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Base library common to many KDE games"
LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS="*"
IUSE=""

DEPEND="
	$(add_qt_dep qtdeclarative widgets)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtsvg)
	$(add_qt_dep qtxml)
	$(add_frameworks_dep karchive)
	$(add_frameworks_dep kbookmarks)
	$(add_frameworks_dep kcodecs)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kcrash)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep kdeclarative)
	$(add_frameworks_dep kdnssd)
	$(add_frameworks_dep kglobalaccel)
	$(add_frameworks_dep kguiaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kitemviews)
	$(add_frameworks_dep kjobwidgets)
	$(add_frameworks_dep knewstuff)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep ktextwidgets)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kxmlgui)
	media-libs/libsndfile
	media-libs/openal
"
RDEPEND="${DEPEND}"