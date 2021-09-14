# Distributed under the terms of the GNU General Public License v2

EAPI=7

KMNAME="plasma-workspace"
FRAMEWORKS_MINIMAL=5.83.0
QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="Legacy xembed tray icons support for SNI-only system trays"
HOMEPAGE="https://invent.kde.org/plasma/plasma-workspace/-/blob/master/xembed-sni-proxy/Readme.md"

LICENSE="GPL-2"
SLOT="5"
KEYWORDS="*"

DEPEND="
	$(add_qt_dep qtcore)
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtx11extras)
	$(add_frameworks_dep extra-cmake-modules)
	$(add_frameworks_dep kwindowsystem X)
	x11-libs/libxcb
	x11-libs/libXtst
	x11-libs/xcb-util-image
"
RDEPEND="${DEPEND}
	!kde-plasma/xembed-sni-proxy:0
"

S="${S}/${PN}"

src_prepare() {
	kde5_src_prepare

	sed -e "/set/s/GENTOO_PV/$(ver_cut 1-3)/" \
		-i CMakeLists.txt || die "Failed to prepare CMakeLists.txt"
}
