# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="forceoptional"
FRAMEWORKS_MINIMAL=5.75.0
QT_MINIMAL=5.15.1
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Libraries and daemons to implement searching in Akonadi"
HOMEPAGE="https://invent.kde.org/pim/akonadi-search"
LICENSE="GPL-2+ LGPL-2.1+"
SLOT="5"
KEYWORDS="*"
IUSE=""

RESTRICT+=" test" # perpetually broken, bug 662378

BDEPEND="
	test? ( $(add_kdeapps_dep akonadi tools) )
"
RDEPEND="
	>=dev-libs/xapian-1.3:=[chert(+)]
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_kdeapps_dep akonadi)
	$(add_kdeapps_dep akonadi-mime)
	$(add_kdeapps_dep kmime)
	$(add_frameworks_dep kcalendarcore)
	$(add_frameworks_dep kcmutils)
	$(add_frameworks_dep kcodecs)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcontacts)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep krunner)
"
DEPEND="${RDEPEND}
	dev-libs/boost
	test? ( $(add_kdeapps_dep akonadi mariadb,postgres,sqlite) )
"