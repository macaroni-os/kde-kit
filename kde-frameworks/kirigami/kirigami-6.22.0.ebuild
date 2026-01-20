# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 toolchain-funcs

DESCRIPTION="Lightweight user interface framework for mobile and convergent applications"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/kirigami-6.22.0.tar.xz -> kirigami-6.22.0.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="examples openmp"
BDEPEND="dev-qt/qttools:6[linguist]
	
"
RDEPEND="examples? (
	    !kde-frameworks/kirigami:5[examples(-)]
	    dev-qt/qt5compat:6[qml]
	)
	
"
DEPEND="${RDEPEND}
	dev-qt/qtbase:6[gui]
	dev-qt/qtdeclarative:6
	dev-qt/qtsvg:6
	
"
pkg_pretend() {
	  [[ ${MERGE_TYPE} != binary ]] && use openmp && tc-check-openmp
}

pkg_setup() {
	  [[ ${MERGE_TYPE} != binary ]] && use openmp && tc-check-openmp
}

src_configure() {
	  local mycmakeargs=(
	      -DBUILD_EXAMPLES=$(usex examples)
	      $(cmake_use_find_package openmp OpenMP)
	  )
	   kde6_src_configure
}


# vim: filetype=ebuild
