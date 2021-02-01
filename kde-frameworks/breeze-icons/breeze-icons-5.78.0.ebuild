# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit kde5

DESCRIPTION="Breeze SVG icon theme"
LICENSE="LGPL-3"
KEYWORDS="*"
IUSE="test"

BDEPEND="
	$(add_qt_dep qtcore)
	$(add_frameworks_dep extra-cmake-modules)
	test? ( app-misc/fdupes )
"
RESTRICT+=" !test? ( test )"

src_prepare() {
	kde5_src_prepare
	use test || cmake_comment_add_subdirectory autotests
}

src_configure() {
	local mycmakeargs=(
		-DBINARY_ICONS_RESOURCE=OFF
	)
	kde5_src_configure
}
