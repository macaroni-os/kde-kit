# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_DESIGNERPLUGIN="true"
QT_MINIMAL=5.15.2
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Framework for icon theming and configuration"
LICENSE="LGPL-2+"
KEYWORDS="*"
IUSE=""

DEPEND="
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtsvg)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep karchive)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kitemviews)
	$(add_frameworks_dep kwidgetsaddons)
"
RDEPEND="${DEPEND}"

RESTRICT+=" test" # bug 574770