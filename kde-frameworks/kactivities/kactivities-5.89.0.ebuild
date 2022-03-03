# Distributed under the terms of the GNU General Public License v2

EAPI=7

PLASMA_MINIMAL=5.16.5
QT_MINIMAL=5.15.2
inherit kde5

DESCRIPTION="Framework for working with KDE activities"
LICENSE="|| ( LGPL-2.1 LGPL-3 )"
KEYWORDS="*"
IUSE=""

COMMON_DEPEND="
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtdeclarative widgets)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtsql)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kcoreaddons)
"
RDEPEND="${COMMON_DEPEND}
	$(add_plasma_dep kactivitymanagerd)
"
DEPEND="${COMMON_DEPEND}
	>=dev-libs/boost-1.54
"