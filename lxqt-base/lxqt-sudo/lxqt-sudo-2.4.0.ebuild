# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="GUI frontend for sudo/su"
HOMEPAGE="https://lxqt-project.org"
SRC_URI="https://api.github.com/repos/lxqt/lxqt-sudo/tarball/2.4.0 -> lxqt-sudo-2.4.0-10d99ba.tar.gz"
LICENSE="LGPL-2.1 LGPL-2.1+"
SLOT="0"
KEYWORDS="*"
RDEPEND="app-admin/sudo
	dev-qt/qtbase:6[gui]
	lxqt-base/liblxqt
	
"
DEPEND="${RDEPEND}
	dev-util/lxqt-build-tools
	
"

post_src_unpack() {
	mv lxqt-lxqt-sudo-* ${S}
}



# vim: filetype=ebuild
