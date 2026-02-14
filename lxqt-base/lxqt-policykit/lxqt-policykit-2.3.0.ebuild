# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="The LXQt PolicyKit agent"
HOMEPAGE="https://lxqt-project.org"
SRC_URI="https://api.github.com/repos/lxqt/lxqt-policykit/tarball/2.3.0 -> lxqt-policykit-2.3.0-5b30f95.tar.gz"
LICENSE="LGPL-2.1 LGPL-2.1+"
SLOT="0"
KEYWORDS="*"
RDEPEND="dev-qt/qtbase:6[gui]
	lxqt-base/liblxqt
	>=sys-auth/polkit-qt-0.200.0[qt6]
	
"
DEPEND="${RDEPEND}
	dev-util/lxqt-build-tools
	dev-qt/qttools:6[linguist]
	virtual/pkgconfig
	
"

post_src_unpack() {
	mv lxqt-lxqt-policykit-* ${S}
}


src_install() {
	  cmake_src_install
	  doman man/*.1
}



# vim: filetype=ebuild
