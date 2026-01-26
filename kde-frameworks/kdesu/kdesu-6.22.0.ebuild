# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Framework to handle super user actions"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/kdesu-6.22.0.tar.xz -> kdesu-6.22.0.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="X"
RDEPEND="kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kpty:6
	X? ( x11-libs/libX11 )
	
"
DEPEND="${RDEPEND}
	X? ( x11-base/xorg-proto )
	
"
src_prepare() {
	  kde6_src_prepare
}

src_configure() {
	  local mycmakeargs=(
	      $(cmake_use_find_package X X11)
	  )
	   kde6_src_configure
}


# vim: filetype=ebuild
