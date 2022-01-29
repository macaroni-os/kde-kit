# Distributed under the terms of the GNU General Public License v2

EAPI=7

FRAMEWORKS_MINIMAL=5.83.0
QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="KDE Plasma daemon listening for wall and write messages"
LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS="*"
IUSE=""

DEPEND="
	$(add_qt_dep qtgui)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep kpty)
"
RDEPEND="${DEPEND}"