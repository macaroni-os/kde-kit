# Distributed under the terms of the GNU General Public License v2

EAPI=7

QT_MINIMAL=5.15.1
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Framework to handle global shortcuts"
KEYWORDS="*"
LICENSE="LGPL-2+"
IUSE="nls"

BDEPEND="
	nls? ( $(add_qt_dep linguist-tools) )
"
DEPEND="
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtx11extras)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kcrash)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep kwindowsystem X)
	x11-libs/libxcb
	x11-libs/xcb-util-keysyms
"
RDEPEND="${DEPEND}"