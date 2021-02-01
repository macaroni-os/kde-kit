# Distributed under the terms of the GNU General Public License v2

EAPI=7

KMNAME="${PN}-1"
FRAMEWORKS_MINIMAL=5.74.0
QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="PolKit agent module for KDE Plasma"
HOMEPAGE="https://kde.org/"

LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS="*"
IUSE=""

DEPEND="
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kcrash)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kwindowsystem)
	>=sys-auth/polkit-qt-0.113.0
"
RDEPEND="${DEPEND}"
