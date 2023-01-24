# Distributed under the terms of the GNU General Public License v2

EAPI=7

FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="KDE Telepathy krunner plugin"
HOMEPAGE="https://community.kde.org/KTp"
LICENSE="LGPL-2.1"
SLOT="5"
KEYWORDS="*"
IUSE=""

RDEPEND="
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_kdeapps_dep ktp-common-internals)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep krunner)
	>=net-libs/telepathy-qt-0.9.8
"
DEPEND="${RDEPEND}
	$(add_frameworks_dep kservice)
"