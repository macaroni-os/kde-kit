# Distributed under the terms of the GNU General Public License v2

EAPI=7

KMNAME="oxygen-icons5"
QT_MINIMAL=5.15.2
inherit kde5

DESCRIPTION="Oxygen SVG icon theme"
LICENSE="LGPL-3"
KEYWORDS="*"
IUSE="test"

BDEPEND="
	$(add_qt_dep qtcore)
	$(add_frameworks_dep extra-cmake-modules)
	test? ( app-misc/fdupes )
"
DEPEND="test? ( $(add_qt_dep qttest) )"

RESTRICT+=" !test? ( test )"

src_prepare() {
	kde5_src_prepare
	use test || cmake_comment_add_subdirectory autotests
}