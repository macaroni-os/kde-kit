# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Framework to handle global shortcuts"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/kglobalaccel-6.22.0.tar.xz -> kglobalaccel-6.22.0.tar.xz"
LICENSE="GPL-2"
SLOT="6"
KEYWORDS="*"
IUSE="X"
BDEPEND="dev-qt/qttools:6[linguist]
	
"
RDEPEND="virtual/kde-seed[gui,X?]
	
"
DEPEND="${RDEPEND}
"
src_configure() {
	local mycmakeargs=(
	  -DWITH_X11=$(usex X)
	)
	cmake_src_configure
}


# vim: filetype=ebuild
