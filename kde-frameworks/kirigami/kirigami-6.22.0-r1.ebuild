# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake toolchain-funcs

DESCRIPTION="Lightweight user interface framework for mobile and convergent applications"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/kirigami-6.22.0.tar.xz -> kirigami-6.22.0.tar.xz"
LICENSE="GPL-2"
SLOT="6"
KEYWORDS="*"
IUSE="examples openmp"
BDEPEND="dev-qt/qttools:6[linguist]
	
"
RDEPEND="virtual/kde-seed[gui,declarative,svg]
	examples? (
	    dev-qt/qt5compat:6[qml]
	)
	
"
DEPEND="${RDEPEND}
"
pkg_pretend() {
	  [[ ${MERGE_TYPE} != binary ]] && use openmp && tc-check-openmp
}
src_configure() {
	local mycmakeargs=(
	  -DBUILD_EXAMPLES=$(usex examples)
	  $(cmake_use_find_package openmp OpenMP)
	)
	cmake_src_configure
}


# vim: filetype=ebuild
