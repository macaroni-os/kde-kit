# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="true"
FRAMEWORKS_MINIMAL=5.75.0
QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="Client library to access and handling of KAlarm calendar data"
SRC_URI="https://download.kde.org/stable/release-service/21.12.1/src/kalarmcal-21.12.1.tar.xz"
LICENSE="GPL-2+ LGPL-2.1+"
SLOT="5"
KEYWORDS="*"
IUSE=""

RDEPEND="
	$(add_qt_dep qtgui)
	$(add_kdeapps_dep akonadi)
	$(add_kdeapps_dep kcalutils)
	$(add_kdeapps_dep kidentitymanagement)
	$(add_frameworks_dep kcalendarcore)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kholidays)
	$(add_frameworks_dep ki18n)
"
DEPEND="${RDEPEND}
	test? ( $(add_qt_dep qtdbus) )
"

src_test() {
	LC_TIME="C" kde5_src_test #bug 665626
}