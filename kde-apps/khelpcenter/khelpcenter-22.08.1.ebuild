# Distributed under the terms of the GNU General Public License v2

EAPI=7

FRAMEWORKS_MINIMAL=5.98.0
PLASMA_MINIMAL=5.16.5
QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="Application to read documentation for KDE Plasma, Applications, Utilities"
HOMEPAGE="https://apps.kde.org/en/Help https://userbase.kde.org/KHelpCenter"
LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS="*"
IUSE=""

DEPEND="
	dev-libs/grantlee:5
	dev-libs/libxml2
	dev-libs/xapian:=
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtxml)
	$(add_frameworks_dep karchive)
	$(add_frameworks_dep kbookmarks)
	$(add_frameworks_dep kcodecs)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep kdoctools)
	$(add_frameworks_dep khtml)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kinit)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kparts)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kwindowsystem)
	$(add_frameworks_dep kxmlgui)
"
RDEPEND="${DEPEND}
	$(add_plasma_dep kde-cli-tools)
"

src_prepare() {
	kde5_src_prepare
	sed -e "/^install.*kde4\/services/s/^/#DONT/" -i CMakeLists.txt || die
}