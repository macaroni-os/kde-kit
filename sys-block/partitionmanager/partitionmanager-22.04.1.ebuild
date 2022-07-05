# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="optional"
FRAMEWORKS_MINIMAL=5.94.0
QT_MINIMAL=5.15.2
inherit kde5
SRC_URI="mirror://kde/stable/release-service/${PV}/src/${P}.tar.xz"
DESCRIPTION="Utility for management of disks, partitions and file systems"
HOMEPAGE="https://apps.kde.org/en/partitionmanager"
LICENSE="GPL-3"
SLOT="5"
KEYWORDS="*"
IUSE=""

DEPEND="
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kcrash)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kjobwidgets)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kxmlgui)
	>=sys-libs/kpmcore-$(ver_cut 1-3)
"
RDEPEND="${DEPEND}"
