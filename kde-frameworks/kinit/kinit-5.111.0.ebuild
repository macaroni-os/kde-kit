# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_QTHELP="false"
KDE_TEST="false"
QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="Helper library to speed up start of applications on KDE work spaces"
LICENSE="LGPL-2+"
KEYWORDS="*"
IUSE="+caps +man X"

BDEPEND="
	man? ( $(add_frameworks_dep kdoctools) )
"
RDEPEND="
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kcrash)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep kwindowsystem)
	caps? ( sys-libs/libcap )
	X? (
		x11-libs/libX11
		x11-libs/libxcb
	)
"
DEPEND="${RDEPEND}
	X? ( x11-base/xorg-proto )
"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package caps Libcap)
		$(cmake-utils_use_find_package man KF5DocTools)
		$(cmake-utils_use_find_package X X11)
		$(cmake-utils_use_find_package X XCB)
	)

	kde5_src_configure
}