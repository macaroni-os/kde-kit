# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
PYTHON_COMPAT=( python3+ )
inherit cmake python-any-r1

DESCRIPTION="Extra modules and scripts for CMake"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/extra-cmake-modules-6.22.0.tar.xz -> extra-cmake-modules-6.22.0.tar.xz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"
IUSE="doc"
BDEPEND="doc? (
	    ${PYTHON_DEPS}
	    $(python_gen_any_dep 'dev-python/sphinx[${PYTHON_USEDEP}]')
	    dev-qt/qttools:6[assistant]
	)
	
"
RDEPEND="app-arch/libarchive[bzip2]
	!kde-frameworks/extra-cmake-modules:5
	
"
DEPEND="${RDEPEND}
"
pkg_setup() {
	  use doc && python-any-r1_pkg_setup
}
src_prepare() {
	  cmake_src_prepare
}
src_configure() {
	  local mycmakeargs=(
	      -DDOC_INSTALL_DIR=/usr/share/doc/"${PF}"
	      -DBUILD_QTHELP_DOCS=$(usex doc)
	      -DBUILD_HTML_DOCS=$(usex doc)
	      -DBUILD_MAN_DOCS=$(usex doc)
	      -DBUILD_TESTING=OFF
	  )
	  cmake_src_configure
}


# vim: filetype=ebuild
