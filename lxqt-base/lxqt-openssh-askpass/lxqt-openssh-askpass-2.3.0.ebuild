# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="GUI to query passwords on behalf of SSH agents."
HOMEPAGE="https://lxqt-project.org"
SRC_URI="https://api.github.com/repos/lxqt/lxqt-openssh-askpass/tarball/2.3.0 -> lxqt-openssh-askpass-2.3.0-effa588.tar.gz"
LICENSE="LGPL-2.1 LGPL-2.1+"
SLOT="0"
KEYWORDS="*"
RDEPEND="dev-qt/qtbase:6
	lxqt-base/liblxqt
	
"
DEPEND="${RDEPEND}
	dev-util/lxqt-build-tools
	dev-qt/qttools:6[linguist]
	
"

post_src_unpack() {
	mv lxqt-lxqt-openssh-askpass-* ${S}
}


src_install() {
	  cmake_src_install
	  doman man/*.1
}



# vim: filetype=ebuild
