# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional" # not optional until !kdelibs4support
inherit kde5

DESCRIPTION="Locate KIO slave"
HOMEPAGE="https://www.linux-apps.com/content/show.php/kio-locate?content=120965"
SRC_URI="https://github.com/reporter123/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="5"
KEYWORDS="*"
IUSE="debug"

PATCHES=(
	"${FILESDIR}/${P}-gcc-4.7.patch"
	"${FILESDIR}/${P}-kf5port.patch"
)

DEPEND="
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdelibs4support)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kwidgetsaddons)
"
RDEPEND="${DEPEND}
	sys-apps/mlocate
"
