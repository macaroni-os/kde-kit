# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Framework for converting units"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/kunitconversion-6.22.0.tar.xz -> kunitconversion-6.22.0.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="dev-qt/qtbase:6
	kde-frameworks/ki18n:6
	
"
DEPEND="${RDEPEND}
	
"
src_test() {
	  local CMAKE_SKIP_TESTS=(
	      # bug 623938 - needs internet connection
	      convertertest
	      # bug 808216 - needs internet connection
	      categorytest
	      # bug 808216 - unknown, reported upstream
	      currencytableinittest
	  )
	   LC_NUMERIC="C" kde6_src_test # bug 694804
}
src_prepare() {
	  kde6_src_prepare
}

src_configure() {
	  local mycmakeargs=(
	      -DBUILD_PYTHON_BINDINGS=OFF
	      -DCMAKE_DISABLE_FIND_PACKAGE_{Python3,PySide6,Shiboken6}=ON
	  )
	  kde6_src_configure
}


# vim: filetype=ebuild
