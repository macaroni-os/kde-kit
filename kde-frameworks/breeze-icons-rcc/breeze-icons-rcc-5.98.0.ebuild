# Distributed under the terms of the GNU General Public License v2

EAPI=7

KMNAME="breeze-icons"
PYTHON_COMPAT=( python3+ )
inherit kde5 python-any-r1

DESCRIPTION="Breeze SVG icon theme binary resource"
LICENSE="LGPL-3"
KEYWORDS="*"
IUSE="test"

BDEPEND="
	${PYTHON_DEPS}
    $(python_gen_any_dep 'dev-python/lxml[${PYTHON_USEDEP}]')
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

src_configure() {
	local mycmakeargs=(
		-DPython_EXECUTABLE="${PYTHON}"
		-DBINARY_ICONS_RESOURCE=ON
		-DSKIP_INSTALL_ICONS=ON
	)
	kde5_src_configure
}