# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Framework for registering services and applications per freedesktop standards"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/kdbusaddons-6.22.0.tar.xz -> kdbusaddons-6.22.0.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="X"
BDEPEND="dev-qt/qttools:6[linguist]
	
"
RDEPEND="dev-qt/qtbase:6
	X? ( dev-qt/qtbase:6=[gui,X] )
	
"
DEPEND="${RDEPEND}
	
"
src_prepare() {
	  kde6_src_prepare
}

src_configure() {
	  local mycmakeargs=(
	      -DWITH_X11=$(usex X)
	  )
	   kde6_src_configure
}


# vim: filetype=ebuild
