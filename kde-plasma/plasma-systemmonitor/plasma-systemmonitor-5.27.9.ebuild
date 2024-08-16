# Distributed under the terms of the GNU General Public License v2

EAPI=7

FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.15.2
inherit kde5

DESCRIPTION="New version of KSysGuard built on top of the new KStats daemon and using QML"
HOMEPAGE="https://invent.kde.org/plasma/plasma-systemmonitor"

LICENSE="|| ( GPL-3 GPL-2 )"
SLOT="5"
KEYWORDS="*"
IUSE=""

DEPEND="
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep kdeclarative)
	$(add_frameworks_dep kglobalaccel)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kitemmodels)
	$(add_frameworks_dep knewstuff)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep kwindowsystem)
	$(add_plasma_dep libksysguard)
"
RDEPEND="${DEPEND}
	$(add_qt_dep qtquickcontrols2)
	$(add_frameworks_dep kirigami)
	$(add_frameworks_dep kitemmodels qml)
	$(add_frameworks_dep kquickcharts)
	$(add_plasma_dep ksystemstats)
"
