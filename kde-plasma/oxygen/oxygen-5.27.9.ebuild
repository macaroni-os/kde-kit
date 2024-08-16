# Distributed under the terms of the GNU General Public License v2

EAPI=7

FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.15.2
inherit kde5

DESCRIPTION="Oxygen visual style for the Plasma desktop"
HOMEPAGE="https://invent.kde.org/plasma/oxygen"
LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS="*"
IUSE="wayland"

COMMON_DEPEND="
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtx11extras)
	$(add_frameworks_dep frameworkintegration)
	$(add_frameworks_dep kcmutils)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kguiaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kwindowsystem)
	$(add_plasma_dep kdecoration)
	x11-libs/libxcb
	wayland? ( $(add_frameworks_dep kwayland) )
"
DEPEND="${COMMON_DEPEND}
	$(add_frameworks_dep kservice)
"
RDEPEND="${COMMON_DEPEND}
	!<kde-plasma/plasma-desktop-5.16.80
"
PDEPEND="
	$(add_plasma_dep kde-cli-tools)
"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package wayland KF5Wayland)
	)
	kde5_src_configure
}