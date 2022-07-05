# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_AUTODEPS="false"
FRAMEWORKS_MINIMAL=5.94.0
QT_MINIMAL=5.15.2
inherit kde5
SRC_URI="mirror://kde/stable/release-service/${PV}/src/${P}.tar.xz"
DESCRIPTION="Library for managing partitions"
HOMEPAGE="https://apps.kde.org/en/partitionmanager"
LICENSE="GPL-3"
SLOT="5/10"
KEYWORDS="*"
IUSE=""

BDEPEND="virtual/pkgconfig"
DEPEND="
	$(add_frameworks_dep kauth)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	|| (
		app-crypt/qca[botan]
		app-crypt/qca[ssl]
	)
	>=sys-apps/util-linux-2.33.2
"
RDEPEND="${DEPEND}"

# bug 689468, tests need polkit etc.
RESTRICT+=" test"
