# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit kde5

DESCRIPTION="MPRIS2 client, written in QML for Plasma 5"
HOMEPAGE="https://github.com/audoban/PlayBar2"
SRC_URI="https://github.com/audoban/PlayBar2/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
IUSE=""
KEYWORDS="*"

BDEPEND="$(add_frameworks_dep extra-cmake-modules)
	$(add_frameworks_dep kdoctools)"
DEPEND="$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kglobalaccel)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kwindowsystem)
	$(add_frameworks_dep kxmlgui)
	$(add_frameworks_dep plasma)
	$(add_qt_dep qtcore)
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtquickcontrols)
	$(add_qt_dep qtwidgets)"
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}/${P}-raise_qtquick_to_2_7.patch" )
