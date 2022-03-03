# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="true"
FRAMEWORKS_MINIMAL=5.86.0
QT_MINIMAL=5.15.2
inherit kde5

DESCRIPTION="Plasma integration for controlling Thunderbolt devices"
HOMEPAGE="https://invent.kde.org/plasma/plasma-thunderbolt"
LICENSE="|| ( GPL-2 GPL-3+ )"
SLOT="5"
KEYWORDS="*"
IUSE=""

DEPEND="
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_frameworks_dep kcmutils)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep kdeclarative)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep knotifications)
"
RDEPEND="${DEPEND}
	$(add_qt_dep qtquickcontrols2)
	$(add_frameworks_dep kirigami)
	sys-apps/bolt
"

# tests require DBus
RESTRICT+=" test"