# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Framework for intercepting and handling application crashes"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/kcrash-6.22.0.tar.xz -> kcrash-6.22.0.tar.xz"
LICENSE="GPL-2"
SLOT="6"
KEYWORDS="*"
IUSE="X"
BDEPEND="dev-qt/qttools:6[linguist]
	
"
RDEPEND="virtual/kde-seed[gui]
	kde-frameworks/kcoreaddons:6
	X? ( x11-libs/libX11 )
	
"
DEPEND="${RDEPEND}
	X? ( x11-base/xorg-proto )
	
"
src_configure() {
	local mycmakeargs=(
	  -DWITH_X11=$(usex X)
	)
	cmake_src_configure
}


# vim: filetype=ebuild
