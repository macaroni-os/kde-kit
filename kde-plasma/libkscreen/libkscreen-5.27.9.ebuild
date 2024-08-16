# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_QTHELP="true"
KDE_TEST="forceoptional"
FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.15.2
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Plasma screen management library"
LICENSE="GPL-2" # TODO: CHECK
SLOT="5/7"
KEYWORDS="*"
IUSE=""

RDEPEND="
	dev-libs/wayland
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwayland)
	$(add_qt_dep qtx11extras)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kwayland)
	x11-libs/libxcb
"
DEPEND="${RDEPEND}
	>=dev-libs/plasma-wayland-protocols-1.10.0
"
BDEPEND="
	dev-util/wayland-scanner
"
# requires running session
RESTRICT+=" test"
