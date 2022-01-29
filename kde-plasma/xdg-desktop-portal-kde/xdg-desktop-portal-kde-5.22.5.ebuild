# Distributed under the terms of the GNU General Public License v2

EAPI=7

FRAMEWORKS_MINIMAL=5.83.0
QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="Backend implementation for xdg-desktop-portal that is using Qt/KDE Frameworks"
LICENSE="LGPL-2+"
SLOT="5"
KEYWORDS="*"
IUSE=""

COMMON_DEPEND="
	>=dev-libs/wayland-1.15
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtprintsupport)[cups]
	$(add_qt_dep qtwayland)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdeclarative)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kirigami)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep plasma)
"
DEPEND="${COMMON_DEPEND}
	>=dev-libs/plasma-wayland-protocols-1.1.1
	$(add_qt_dep qtconcurrent)
	$(add_frameworks_dep kwayland)
"
RDEPEND="${COMMON_DEPEND}
	sys-apps/xdg-desktop-portal
"