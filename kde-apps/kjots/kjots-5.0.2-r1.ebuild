# Distributed under the terms of the GNU General Public License v2

EAPI=7

FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.12.3
inherit kde5

DESCRIPTION="Note taking utility by KDE"
HOMEPAGE="https://userbase.kde.org/KJots https://community.kde.org/PIM/KJots"
SRC_URI="mirror://kde/stable/${PN}/${PV}/${P}.tar.xz"

LICENSE="GPL-2"
SLOT="5"
KEYWORDS="*"
IUSE=""

DEPEND="
	dev-libs/grantlee:5
	dev-libs/libxslt
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtprintsupport)
	$(add_qt_dep qtwidgets)
	$(add_kdeapps_dep akonadi)
	$(add_kdeapps_dep akonadi-notes)
	$(add_kdeapps_dep kmime)
	$(add_kdeapps_dep kontactinterface)
	$(add_kdeapps_dep kpimtextedit)
	$(add_frameworks_dep kbookmarks)
	$(add_frameworks_dep kcmutils)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kitemmodels)
	$(add_frameworks_dep kparts)
	$(add_frameworks_dep ktextwidgets)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kxmlgui)
"
RDEPEND="${DEPEND}"

PATCHES+=(
	"${FILESDIR}/${P}-kf5bookmarks-5.69.patch" # KDE-Bug 384000
	"${FILESDIR}/${P}-kontactinterface-20.08.patch"
)
