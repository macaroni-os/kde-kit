# Distributed under the terms of the GNU General Public License v2

EAPI=7

KMNAME="${PN}-framework"
QT_MINIMAL=5.15.1
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Plasma framework"
LICENSE="LGPL-2+"
KEYWORDS="*"
IUSE="gles2-only man wayland X"

BDEPEND="
	man? ( $(add_frameworks_dep kdoctools) )
"
RDEPEND="
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui gles2-only=)
	$(add_qt_dep qtquickcontrols)
	$(add_qt_dep qtsql)
	$(add_qt_dep qtsvg)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtx11extras)
	$(add_frameworks_dep kactivities)
	$(add_frameworks_dep karchive)
	$(add_frameworks_dep kconfig qml)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdeclarative)
	$(add_frameworks_dep kglobalaccel)
	$(add_frameworks_dep kguiaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kirigami)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep kpackage)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kwindowsystem)
	$(add_frameworks_dep kxmlgui)
	x11-libs/libX11
	x11-libs/libxcb
	!gles2-only? ( virtual/opengl )
	wayland? (
		$(add_frameworks_dep kwayland)
		media-libs/mesa[egl]
	)
	$(add_qt_dep qtx11extras)
	x11-libs/libX11
	x11-libs/libxcb
"
DEPEND="${RDEPEND}
	x11-base/xorg-proto
"

RESTRICT+=" test"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package !gles2-only OpenGL)
		$(cmake_use_find_package man KF5DocTools)
		$(cmake-utils_use_find_package wayland EGL)
		$(cmake-utils_use_find_package wayland KF5Wayland)
	)

	kde5_src_configure
}
