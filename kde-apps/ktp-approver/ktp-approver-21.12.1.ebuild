# Distributed under the terms of the GNU General Public License v2

EAPI=7

FRAMEWORKS_MINIMAL=5.75.0
QT_MINIMAL=5.15.2
inherit kde5

DESCRIPTION="KDE Telepathy notification handler"
HOMEPAGE="https://community.kde.org/KTp"
LICENSE="LGPL-2.1"
SLOT="5"
KEYWORDS="*"
IUSE=""

DEPEND="
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep kservice)
	>=net-libs/telepathy-qt-0.9.8
"
RDEPEND="${DEPEND}
	$(add_kdeapps_dep ktp-contact-list)
"