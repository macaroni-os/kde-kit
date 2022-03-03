# Distributed under the terms of the GNU General Public License v2

EAPI=7

FRAMEWORKS_MINIMAL=5.75.0
QT_MINIMAL=5.15.2
inherit kde5

DESCRIPTION="KDE Telepathy workspace integration"
HOMEPAGE="https://community.kde.org/KTp"
LICENSE="LGPL-2.1"
SLOT="5"
KEYWORDS="*"
IUSE=""

COMMON_DEPEND="
	$(add_qt_dep qtconcurrent)
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtsql)
	$(add_qt_dep qtwidgets)
	$(add_kdeapps_dep ktp-common-internals)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kidletime)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep knotifications)
	>=net-libs/telepathy-qt-0.9.8
"
DEPEND="${COMMON_DEPEND}
	$(add_frameworks_dep kcmutils)
	$(add_frameworks_dep kwidgetsaddons)
"
RDEPEND="${COMMON_DEPEND}
	$(add_kdeapps_dep signon-kwallet-extension)
"