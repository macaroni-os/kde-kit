# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
KDE_TEST="forceoptional"
FRAMEWORKS_MINIMAL=5.75.0
QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="Jukebox and music manager by KDE"
HOMEPAGE="https://apps.kde.org/en/juk"
LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS="*"
IUSE=""

DEPEND="
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtsvg)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtxml)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kcrash)
	$(add_frameworks_dep kglobalaccel)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kjobwidgets)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep ktextwidgets)
	$(add_frameworks_dep kwallet)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kwindowsystem)
	$(add_frameworks_dep kxmlgui)
	>=media-libs/phonon-4.11.0
	>=media-libs/taglib-1.6
"
RDEPEND="${DEPEND}"