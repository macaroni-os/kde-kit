# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="true"
FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.15.1
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Library providing utility functions for the handling of calendar data"
HOMEPAGE="https://api.kde.org/kdepim/kcalutils/html/index.html"
LICENSE="GPL-2+ LGPL-2.1+"
SLOT="5"
KEYWORDS="*"
IUSE=""

DEPEND="
	>=dev-libs/grantlee-5.2.0:5
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_kdeapps_dep kidentitymanagement)
	$(add_frameworks_dep kcalendarcore)
	$(add_frameworks_dep kcodecs)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kwidgetsaddons)
"
RDEPEND="${DEPEND}"

RESTRICT+=" test" # bugs 653616, 711666