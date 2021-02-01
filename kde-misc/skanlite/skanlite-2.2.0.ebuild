# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
KDE_TEST="forceoptional"
FRAMEWORKS_MINIMAL=5.60.0
QT_MINIMAL=5.12.3
inherit kde5

DESCRIPTION="Simple image scanning application based on libksane and KDE Frameworks"
HOMEPAGE="https://apps.kde.org/en/skanlite"
SRC_URI="mirror://kde/stable/${PN}/2.2/${P}.tar.xz"

LICENSE="|| ( GPL-2 GPL-3 ) handbook? ( FDL-1.2+ )"
SLOT="5"
KEYWORDS="*"
IUSE=""

DEPEND="
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_kdeapps_dep libksane)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kjobwidgets)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kxmlgui)
	media-libs/libpng:0=
"
RDEPEND="${DEPEND}"
