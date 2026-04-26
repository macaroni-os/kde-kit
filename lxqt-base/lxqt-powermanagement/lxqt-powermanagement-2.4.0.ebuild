# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Power management module for LXQt"
HOMEPAGE="https://lxqt-project.org"
SRC_URI="https://api.github.com/repos/lxqt/lxqt-powermanagement/tarball/2.4.0 -> lxqt-powermanagement-2.4.0-a6e4ef4.tar.gz"
LICENSE="LGPL-2.1 LGPL-2.1+"
SLOT="0"
KEYWORDS="*"
RDEPEND="dev-libs/libqtxdg
	dev-qt/qtbase:6[gui]
	dev-qt/qtsvg:6
	kde-frameworks/kwindowsystem:6
	kde-frameworks/kidletime:6
	kde-frameworks/solid:6
	lxqt-base/liblxqt
	lxqt-base/lxqt-globalkeys
	sys-power/upower
	
"
DEPEND="${RDEPEND}
	dev-util/lxqt-build-tools
	dev-qt/qttools:6[linguist]
	virtual/pkgconfig
	
"

post_src_unpack() {
	mv lxqt-lxqt-powermanagement-* ${S}
}



# vim: filetype=ebuild
