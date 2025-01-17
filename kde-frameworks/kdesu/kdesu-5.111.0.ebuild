# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="true"
inherit kde5

DESCRIPTION="Framework to handle super user actions"
LICENSE="LGPL-2"
KEYWORDS="*"
IUSE="X"

RDEPEND="
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kpty)
	$(add_frameworks_dep kservice)
	X? ( x11-libs/libX11 )
"
DEPEND="${RDEPEND}
	X? ( x11-base/xorg-proto )
"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package X X11)
	)

	kde5_src_configure
}