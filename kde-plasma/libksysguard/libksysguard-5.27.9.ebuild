# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_DESIGNERPLUGIN="true"
KDE_TEST="true"
FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.15.2
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Task management and system monitoring library"
LICENSE="LGPL-2+"
SLOT="5/9"
KEYWORDS="*"
IUSE="webengine X"

RDEPEND="
	dev-libs/libnl
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtx11extras)
	$(add_frameworks_dep kauth)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig qml)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kglobalaccel)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kjobwidgets)
	$(add_frameworks_dep knewstuff)
	$(add_frameworks_dep kpackage)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kwindowsystem)
	net-libs/libpcap
	sys-apps/lm_sensors:=
	sys-libs/libcap
	sys-libs/zlib
	webengine? (
		$(add_qt_dep qtwebchannel)
		$(add_qt_dep qtwebengine)
	)
	X? (
		$(add_qt_dep qtx11extras)
		x11-libs/libX11
		x11-libs/libXres
	)
"
DEPEND="${RDEPEND}
	!<kde-plasma/plasma-workspace-5.18.80:5
	$(add_frameworks_dep kiconthemes)
	X? ( x11-base/xorg-proto )
"

PATCHES=( "${FILESDIR}/${PN}-5.22.80-no-detailed-mem-message.patch" )

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package webengine Qt5WebChannel)
		$(cmake-utils_use_find_package webengine Qt5WebEngineWidgets)
		$(cmake-utils_use_find_package X X11)
	)

	kde5_src_configure
}

src_test() {
	LC_NUMERIC="C" kde5_src_test # bug 695514
}
