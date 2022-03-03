# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_QTHELP="false"
QT_MINIMAL=5.15.2
inherit kde5

DESCRIPTION="Style for QtQuickControls 2 that uses QWidget's QStyle for painting"
LICENSE="|| ( GPL-2+ LGPL-3+ )"
KEYWORDS="*"
IUSE=""

DEPEND="
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kirigami)
"
RDEPEND="${DEPEND}
	$(add_qt_dep qtgraphicaleffects)
	$(add_qt_dep qtquickcontrols2)
"