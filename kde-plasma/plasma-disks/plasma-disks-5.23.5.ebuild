# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="true"
FRAMEWORKS_MINIMAL=5.86.0
QT_MINIMAL=5.15.2
inherit kde5

DESCRIPTION="Monitors S.M.A.R.T. capable devices for imminent failure"
HOMEPAGE="https://invent.kde.org/plasma/plasma-disks"
LICENSE="|| ( GPL-3 GPL-2 )"
SLOT="5"
KEYWORDS="*"
IUSE=""

DEPEND="
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui)
	$(add_frameworks_dep kauth)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep kdeclarative)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kjobwidgets)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep solid)
	sys-apps/smartmontools
"
RDEPEND="${DEPEND}
	$(add_plasma_dep kinfocenter)
"