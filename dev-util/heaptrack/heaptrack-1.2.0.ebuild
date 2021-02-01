# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit kde5

DESCRIPTION="Fast heap memory profiler"
HOMEPAGE="https://apps.kde.org/en/heaptrack
https://milianw.de/blog/heaptrack-a-heap-memory-profiler-for-linux"
SRC_URI="mirror://kde/stable/${PN}/${PV}/${P}.tar.xz"

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="*"
IUSE="+gui test zstd"

BDEPEND="
	gui? ( $(add_frameworks_dep extra-cmake-modules) )
"
DEPEND="
	dev-libs/boost:=
	sys-libs/libunwind
	sys-libs/zlib
	gui? (
		dev-libs/kdiagram:5
		$(add_qt_dep qtcore)
		$(add_qt_dep qtgui)
		$(add_qt_dep qtwidgets)
		$(add_frameworks_dep kconfig)
		$(add_frameworks_dep kconfigwidgets)
		$(add_frameworks_dep kcoreaddons)
		$(add_frameworks_dep ki18n)
		$(add_frameworks_dep kio)
		$(add_frameworks_dep kitemmodels)
		$(add_frameworks_dep kwidgetsaddons)
		$(add_frameworks_dep threadweaver)
	)
	zstd? ( app-arch/zstd:= )
"
RDEPEND="${DEPEND}
	gui? ( $(add_frameworks_dep kf-env) )
"

RESTRICT+=" !test? ( test )"

src_configure() {
	local mycmakeargs=(
		-DHEAPTRACK_BUILD_GUI=$(usex gui)
		-DBUILD_TESTING=$(usex test)
		$(cmake-utils_use_find_package zstd Zstd)
	)
	kde5_src_configure
}
