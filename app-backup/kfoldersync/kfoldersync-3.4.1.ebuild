# Distributed under the terms of the GNU General Public License v2

EAPI=7

FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.12.3
inherit kde5

DESCRIPTION="Folder synchronization and backup tool based on KDE Frameworks"
HOMEPAGE="https://www.linux-apps.com/p/1127677/"
SRC_URI="https://dl.opendesktop.org/api/files/download/id/1485353737/${P}.tar.xz"

LICENSE="GPL-3"
SLOT="5"
KEYWORDS="*"

BDEPEND="
	sys-devel/gettext
"
DEPEND="
	$(add_qt_dep qtconcurrent)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kitemviews)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kwindowsystem)
	$(add_frameworks_dep kxmlgui)
"
RDEPEND="${DEPEND}"
