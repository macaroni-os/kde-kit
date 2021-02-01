# Distributed under the terms of the GNU General Public License v2

EAPI=7

FRAMEWORKS_MINIMAL=5.75.0
QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="KDE Telepathy authentication handler"
HOMEPAGE="https://community.kde.org/KTp"

LICENSE="LGPL-2.1"
SLOT="5"
KEYWORDS="*"
IUSE=""

DEPEND="
	>=app-crypt/qca-2.3.0:2
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtwidgets)
	$(add_kdeapps_dep kaccounts-integration)
	$(add_kdeapps_dep ktp-common-internals)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kwallet)
	$(add_frameworks_dep kwidgetsaddons)
	net-libs/accounts-qt
	net-libs/signond
	>=net-libs/telepathy-qt-0.9.8
"
RDEPEND="${DEPEND}
	>=app-crypt/qca-2.3.0:2[ssl]
"
