# Distributed under the terms of the GNU General Public License v2

EAPI=7

QT_MINIMAL=5.15.1
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Framework for intercepting and handling application crashes"
LICENSE="LGPL-2+"
KEYWORDS="*"
IUSE="nls"

# requires running kde environment
RESTRICT+=" test"

BDEPEND="
	nls? ( $(add_qt_dep linguist-tools) )
"
RDEPEND="
	$(add_qt_dep qtgui)
	$(add_qt_dep qtx11extras)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kwindowsystem)
	x11-libs/libX11
"
DEPEND="${RDEPEND}
	$(add_qt_dep qttest)
	x11-base/xorg-proto
	test? ( $(add_qt_dep qtwidgets) )
"
