# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="optional"
KDE_QTHELP="false"
KDE_TEST="false"
QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="Framework binding JavaScript objects to QObjects"
LICENSE="LGPL-2+"
KEYWORDS="*"
IUSE=""

RDEPEND="
	$(add_qt_dep qtgui)
	$(add_qt_dep qtsvg)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtxml)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kjs)
"
DEPEND="${RDEPEND}
	$(add_qt_dep designer)
"
