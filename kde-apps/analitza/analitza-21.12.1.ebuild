# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="forceoptional"
QT_MINIMAL=5.15.2
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="KDE library for mathematical features"
LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS="*"
IUSE="eigen nls"

BDEPEND="
	nls? ( $(add_qt_dep linguist-tools) )
"
DEPEND="
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui -gles2-only)
	$(add_qt_dep qtprintsupport)
	$(add_qt_dep qtsvg)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtxml)
	eigen? ( dev-cpp/eigen:3 )
"
RDEPEND="${DEPEND}"

src_prepare() {
	kde5_src_prepare

	if ! use test; then
		sed -i \
			-e "/add_subdirectory(examples)/ s/^/#DONT/" \
			analitzaplot/CMakeLists.txt || die
	fi
}

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package eigen Eigen3)
	)

	kde5_src_configure
}