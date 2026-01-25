# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="An assortment of high-level widgets for common tasks"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/kwidgetsaddons-6.22.0.tar.xz -> kwidgetsaddons-6.22.0.tar.xz"
SLOT="6"
KEYWORDS="*"
BDEPEND="dev-qt/qttools:6[linguist]
	
"
RDEPEND="dev-qt/qtbase:6[gui]
	
"
DEPEND="${RDEPEND}
	
"
CMAKE_SKIP_TESTS=(
	  # bug 650216
	  kdatecomboboxtest
	  # bug 697866
	  ksqueezedtextlabelautotest
	  # bug 926508
	  ktooltipwidgettest
	  # bug 808216
	  ktwofingertaptest
	  ktwofingerswipetest
)
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
