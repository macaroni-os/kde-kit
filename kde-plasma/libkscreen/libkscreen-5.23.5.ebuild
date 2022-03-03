# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_QTHELP="true"
KDE_TEST="forceoptional"
FRAMEWORKS_MINIMAL=5.86.0
QT_MINIMAL=5.15.2
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Plasma screen management library"
LICENSE="GPL-2" # TODO: CHECK
SLOT="5/7"
KEYWORDS="*"
IUSE=""

DEPEND="
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtx11extras)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kwayland)
	x11-libs/libxcb
"
RDEPEND="${DEPEND}"

# requires running session
RESTRICT+=" test"