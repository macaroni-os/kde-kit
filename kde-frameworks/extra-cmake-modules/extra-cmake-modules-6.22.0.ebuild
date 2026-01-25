# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
PYTHON_COMPAT=( python3+ )
inherit cmake kde6 python-any-r1

DESCRIPTION="Extra modules and scripts for CMake"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/extra-cmake-modules-6.22.0.tar.xz -> extra-cmake-modules-6.22.0.tar.xz"
SLOT="0"
KEYWORDS="*"
BDEPEND="doc? (
	    ${PYTHON_DEPS}
	    $(python_gen_any_dep 'dev-python/sphinx[${PYTHON_USEDEP}]')
	    dev-qt/qttools:0[assistant]
	)
	test? (
	    dev-qt/qtbase:0
	    dev-qt/qttools:0[linguist]
	)
	
"
RDEPEND="app-arch/libarchive[bzip2]
	
"
DEPEND="test? (
	    dev-qt/qtbase:0[gui]
	    dev-qt/qtdeclarative:0
	)
	
"
python_check_deps() {
	  python_has_version "dev-python/sphinx[${PYTHON_USEDEP}]"
}

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
	      -DBUILD_TESTING=$(usex test)
	  )
	  if use test; then
	      mycmakeargs+=( -DQT_MAJOR_VERSION=6 ) # bug 938316
	  fi
	   cmake_src_configure
}

src_test() {
	  local CMAKE_SKIP_TESTS=(
	      # passes, but then breaks src_install
	      ECMToolchainAndroidTest
	      # broken, bug #627806
	      ECMPoQmToolsTest
	      # can not possibly succeed in releases, bug #764953
	      KDEFetchTranslations
	  )
	  # possible race condition with multiple jobs, bug #701854
	  cmake_src_test -j1
}


# vim: filetype=ebuild
