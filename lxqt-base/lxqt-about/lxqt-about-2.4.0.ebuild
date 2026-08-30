# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Dialogue window providing information about LXQt and the system it's running on"
HOMEPAGE="https://lxqt-project.org"
SRC_URI="https://api.github.com/repos/lxqt/lxqt-about/tarball/2.4.0 -> lxqt-about-2.4.0-82db208.tar.gz"
LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="*"
RDEPEND="dev-libs/libqtxdg
	dev-qt/qtbase:6
	lxqt-base/liblxqt
	
"
DEPEND="${RDEPEND}
	dev-util/lxqt-build-tools
	
"

post_src_unpack() {
	mv lxqt-lxqt-about-* ${S}
}



# vim: filetype=ebuild
