# Distributed under the terms of the GNU General Public License v2

EAPI=7

FRAMEWORKS_MINIMAL=5.75.0
QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="KDE Telepathy contact list"
HOMEPAGE="https://community.kde.org/KTp"

LICENSE="GPL-2"
SLOT="5"
KEYWORDS="*"
IUSE=""

RDEPEND="
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_kdeapps_dep ktp-common-internals)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep kpeople)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kwindowsystem)
	$(add_frameworks_dep kxmlgui)
	>=net-libs/telepathy-qt-0.9.8
"
DEPEND="${RDEPEND}
	$(add_qt_dep qtxml)
	$(add_frameworks_dep kcmutils)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep knotifyconfig)
"
