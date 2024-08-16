# Distributed under the terms of the GNU General Public License v2

EAPI=7

FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.15.2
inherit kde5

DESCRIPTION="Backend implementation for xdg-desktop-portal that is using Qt/KDE Frameworks"
LICENSE="LGPL-2+"
SLOT="5"
KEYWORDS="*"
IUSE=""

COMMON_DEPEND="
	>=dev-libs/wayland-1.15
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtprintsupport cups)
	$(add_qt_dep qtwayland)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kdeclarative)
	$(add_frameworks_dep kglobalaccel)
	$(add_frameworks_dep kguiaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kirigami)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kwindowsystem)
	$(add_frameworks_dep plasma)
	virtual/pkgconfig
	x11-libs/libxkbcommon
"
DEPEND="${COMMON_DEPEND}
	>=dev-libs/plasma-wayland-protocols-1.7.0
	$(add_qt_dep qtconcurrent)
	$(add_frameworks_dep kwayland)
"
RDEPEND="${COMMON_DEPEND}
	kde-misc/kio-fuse
	sys-apps/xdg-desktop-portal
"
