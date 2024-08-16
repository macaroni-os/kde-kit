# Distributed under the terms of the GNU General Public License v2

EAPI=7

FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.15.2
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Qt Platform Theme integration plugins for the Plasma workspaces"
LICENSE="LGPL-2+"
SLOT="5"
KEYWORDS="*"
IUSE=""

DEPEND="
	>=dev-libs/plasma-wayland-protocols-1.6.0
	dev-libs/wayland
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui dbus)
	$(add_qt_dep qtquickcontrols2)
	$(add_qt_dep qtwayland)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtx11extras)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kjobwidgets)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep kwayland)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kwindowsystem)
	$(add_frameworks_dep kxmlgui)
	$(add_plasma_dep breeze)
	x11-libs/libXcursor
	x11-libs/libxcb
"
RDEPEND="${DEPEND}
	media-fonts/hack
	media-fonts/noto
"

# requires running kde environment
RESTRICT+=" test"
