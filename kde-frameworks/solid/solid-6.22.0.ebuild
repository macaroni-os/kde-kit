# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Provider for platform independent hardware discovery, abstraction and management"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/solid-6.22.0.tar.xz -> solid-6.22.0.tar.xz"
LICENSE="GPL-2"
SLOT="6"
KEYWORDS="*"
IUSE="ios"
BDEPEND="sys-devel/bison
	sys-devel/flex
	dev-qt/qttools:6[linguist]
	
"
RDEPEND="virtual/kde-seed[gui,declarative]
	sys-apps/util-linux
	sys-fs/udisks:2
	virtual/libudev:=
	ios? (
	  app-pda/libimobiledevice:=
	  app-pda/libplist:=
	)
	
"
DEPEND="${RDEPEND}
"
src_configure() {
	local mycmakeargs=(
	  $(cmake_use_find_package ios IMobileDevice)
	  $(cmake_use_find_package ios PList)
	)
	cmake_src_configure
}


# vim: filetype=ebuild
