# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Tool used to launch programs quickly by typing their names"
HOMEPAGE="https://lxqt-project.org"
SRC_URI="https://api.github.com/repos/lxqt/lxqt-runner/tarball/2.4.0 -> lxqt-runner-2.4.0-6407c18.tar.gz"
LICENSE="LGPL-2.1 LGPL-2.1+"
SLOT="0"
KEYWORDS="*"
RDEPEND="dev-cpp/muParser
	dev-libs/libqtxdg
	dev-qt/qtbase:6[gui]
	kde-frameworks/kwindowsystem:6
	kde-plasma/layer-shell-qt:6
	lxqt-base/liblxqt
	lxqt-base/lxqt-globalkeys
	
"
DEPEND="${RDEPEND}
	dev-util/lxqt-build-tools
	dev-qt/qttools:6[linguist]
	virtual/pkgconfig
	
"

post_src_unpack() {
	mv lxqt-lxqt-runner-* ${S}
}


src_install() {
	  cmake_src_install
	  doman man/*.1
}



# vim: filetype=ebuild
