# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="true"
FRAMEWORKS_MINIMAL=5.74.0
QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="Provides integration plugins for various KDE frameworks for Wayland"
HOMEPAGE="https://invent.kde.org/plasma/kwayland-integration"

LICENSE="LGPL-2.1"
SLOT="5"
KEYWORDS="*"
IUSE=""

DEPEND="
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kguiaddons)
	$(add_frameworks_dep kidletime)
	$(add_frameworks_dep kwayland)
	$(add_frameworks_dep kwindowsystem)
"
RDEPEND="${DEPEND}"

RESTRICT+=" test" # bug 668872
