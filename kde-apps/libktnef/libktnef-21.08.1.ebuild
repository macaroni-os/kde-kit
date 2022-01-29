# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="true"
KMNAME="ktnef"
FRAMEWORKS_MINIMAL=5.75.0
QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="Library for handling TNEF data"

LICENSE="GPL-2+"
SLOT="5"
KEYWORDS="*"
IUSE=""

DEPEND="
	$(add_qt_dep qtwidgets)
	$(add_kdeapps_dep kcalutils)
	$(add_frameworks_dep kcalendarcore)
	$(add_frameworks_dep kcontacts)
	$(add_frameworks_dep ki18n)
"
RDEPEND="${DEPEND}"
