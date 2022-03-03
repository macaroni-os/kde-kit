# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_QTHELP="false"
QT_MINIMAL=5.15.2
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Framework for integrating Qt applications with KDE Plasma workspaces"
LICENSE="LGPL-2+"
KEYWORDS="*"
IUSE="appstream X"

RDEPEND="
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep knewstuff)
	$(add_frameworks_dep knotifications)
	appstream? (
		app-admin/packagekit-qt
		dev-libs/appstream[qt5]
	)
	X? (
		$(add_qt_dep qtx11extras)
		x11-libs/libxcb
	)
"

DEPEND="${RDEPEND}
	$(add_frameworks_dep kpackage)
	$(add_frameworks_dep kwidgetsaddons)
"

# requires running Plasma environment
RESTRICT+=" test"

src_configure() {
	local mycmakeargs=(
		-DCMAKE_DISABLE_FIND_PACKAGE_AppStreamQt=ON
		-DCMAKE_DISABLE_FIND_PACKAGE_packagekitqt5=ON
	)

	kde5_src_configure
}