# Distributed under the terms of the GNU General Public License v2

EAPI=7

CMAKE_MAKEFILE_GENERATOR="emake"
KDE_HANDBOOK="forceoptional"
KDE_TEST="forceoptional"
LUA_COMPAT=( luajit )
PYTHON_COMPAT=( python3+ )
FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.15.2
inherit eutils kde5 lua-single python-single-r1

DESCRIPTION="Interface for doing mathematics and scientific computing"
HOMEPAGE="https://apps.kde.org/en/cantor https://edu.kde.org/cantor/"
LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS="*"
IUSE="+analitza julia lua postscript python qalculate R"

REQUIRED_USE="lua? ( ${LUA_REQUIRED_USE} ) python? ( ${PYTHON_REQUIRED_USE} )"

# TODO Add Sage Mathematics Software backend (https://www.sagemath.org)
DEPEND="
	app-text/poppler[qt5]
	$(add_qt_dep qtgui)
	$(add_qt_dep qthelp)
	$(add_qt_dep qtprintsupport)
	$(add_qt_dep qtsvg)
	$(add_qt_dep qttest)
	$(add_qt_dep qtwebengine)[widgets]
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtxml)
	$(add_qt_dep qtxmlpatterns)
	$(add_frameworks_dep karchive)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kcrash)
	$(add_frameworks_dep kdoctools)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep knewstuff)
	$(add_frameworks_dep kparts)
	$(add_frameworks_dep kpty)
	$(add_frameworks_dep ktexteditor)
	$(add_frameworks_dep ktextwidgets)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kxmlgui)
	$(add_frameworks_dep syntax-highlighting)
	analitza? ( $(add_kdeapps_dep analitza) )
	julia? ( dev-lang/julia )
	lua? ( ${LUA_DEPS} )
	qalculate? (
		sci-libs/cln
		sci-libs/libqalculate:=
	)
	postscript? ( app-text/libspectre )
	python? (
		${PYTHON_DEPS}
		$(add_qt_dep qtdbus)
	)
	R? ( dev-lang/R )
"
RDEPEND="${DEPEND}
	!analitza? ( !julia? ( !lua? ( !python? ( !qalculate? ( !R? (
		|| (
			sci-mathematics/maxima
			sci-mathematics/octave
		)
	) ) ) ) ) )
"
BDEPEND="x11-misc/shared-mime-info"

RESTRICT+=" test"

pkg_setup() {
	use lua && lua-single_pkg_setup
	use python && python-single-r1_pkg_setup
	kde5_pkg_setup
}

src_configure() {
	use julia && addpredict /proc/self/mem # bug 602894

	local mycmakeargs=(
		$(cmake-utils_use_find_package analitza Analitza5)
		$(cmake-utils_use_find_package julia Julia)
		$(cmake-utils_use_find_package lua LuaJIT)
		-DUSE_LIBSPECTRE=$(usex postscript)
		$(cmake-utils_use_find_package python Python3)
		$(cmake-utils_use_find_package qalculate Qalculate)
		$(cmake-utils_use_find_package R R)
	)
	use lua && mycmakeargs+=(
		-DLUAJIT_INCLUDEDIR="${EPREFIX}/$(lua_get_include_dir)"
		-DLUAJIT_LIBDIR="${EPREFIX}/$(lua_get_cmod_dir)"
	)
	use python && mycmakeargs+=( -DPython3_EXECUTABLE="${PYTHON}" )
	kde5_src_configure
}

pkg_postinst() {
	if [[ -z "${REPLACING_VERSIONS}" ]]; then
		elog "Optional dependencies:"
		optfeature "Maxima backend" sci-mathematics/maxima
		optfeature "Octave backend" sci-mathematics/octave
		optfeature "LaTeX support" virtual/latex-base
	fi
	kde5_pkg_postinst
}
