# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="forceoptional"
FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.12.3
inherit kde5

DESCRIPTION="Tool visualising massif data"
HOMEPAGE="https://apps.kde.org/en/massif-visualizer"
SRC_URI="mirror://kde/stable/${PN}/${PV}/src/${P}.tar.xz"

LICENSE="|| ( GPL-2 GPL-3 )"
SLOT="5"
KEYWORDS="*"
IUSE="+callgraph"

RDEPEND="
	dev-libs/kdiagram:5
	$(add_qt_dep qtgui)
	$(add_qt_dep qtprintsupport)
	$(add_qt_dep qtsvg)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep karchive)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kparts)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kxmlgui)
	callgraph? ( media-gfx/kgraphviewer:5 )
"
DEPEND="${RDEPEND}
	$(add_qt_dep qtxmlpatterns)
"

PATCHES=( "${FILESDIR}/${P}-fix-window-icon.patch" )

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package callgraph KGraphViewerPart)
	)
	kde5_src_configure
}
