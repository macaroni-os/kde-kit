# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="KDE library for mathematical features"
HOMEPAGE="https://invent.kde.org/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/analitza-25.12.2.tar.xz -> analitza-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="eigen"
BDEPEND="dev-qt/qttools:6[linguist]
	
"
RDEPEND="dev-qt/qtbase:6[-gles2-only,gui]
	dev-qt/qtdeclarative:6
	dev-qt/qtsvg:6
	eigen? ( dev-cpp/eigen:3 )
	
"
DEPEND="${RDEPEND}
	
"
src_prepare() {
	  sed -i \
	      -e "/add_subdirectory(examples)/ s/^/#DONT/" \
	      analitzaplot/CMakeLists.txt || die
}

src_configure() {
	  local mycmakeargs=(
	      $(cmake_use_find_package eigen Eigen3)
	  )
	   kde6_src_configure
}


# vim: filetype=ebuild
