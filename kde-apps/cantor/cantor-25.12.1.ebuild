# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 optfeature xdg

DESCRIPTION="Frontend to mathematical software"
HOMEPAGE="https://apps.kde.org/cantor/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.1/src/cantor-25.12.1.tar.xz -> cantor-25.12.1.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="analitza julia lua postscript python qalculate R"
BDEPEND="sys-devel/gettext
	
"
RDEPEND="julia? ( dev-lang/julia )
	postscript? ( app-text/libspectre )
	
"
DEPEND="${RDEPEND}
	dev-qt/qtbase:6[gui,printsupport]
	dev-qt/qtsvg:6
	dev-qt/qtwebengine:6
	kde-frameworks/karchive:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6
	kde-frameworks/knewstuff:6
	kde-frameworks/kparts:6
	kde-frameworks/kpty:6
	kde-frameworks/ktexteditor:6
	kde-frameworks/ktextwidgets:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	kde-frameworks/syntax-highlighting:6
	analitza? ( kde-apps/analitza:6 )
	lua? ( dev-lang/luajit:2 )
	qalculate? ( sci-libs/libqalculate:= )
	python? (
	    >=dev-python/python3-12
	    dev-python/matplotlib
	    dev-python/numpy
	)
	R? ( dev-lang/R )
	
"
src_prepare() {
	  kde6_src_prepare
}

src_configure() {
	  local mycmakeargs=(
	      $(cmake_use_find_package analitza Analitza6)
	      $(cmake_use_find_package julia Julia)
	      $(cmake_use_find_package lua LuaJIT)
	      $(cmake_use_find_package postscript LibSpectre)
	      $(cmake_use_find_package python PythonLibs3)
	      $(cmake_use_find_package qalculate Qalculate)
	      $(cmake_use_find_package R R)
	  )
	   kde6_src_configure
}

pkg_postinst() {
	  if [[ -z "${REPLACING_VERSIONS}" ]]; then
	      optfeature "Maxima support" sci-mathematics/maxima
	      optfeature "Octave support" sci-mathematics/octave
	      optfeature "Sage support" sci-mathematics/sage
	  fi
	  xdg_pkg_postinst
}


# vim: filetype=ebuild
