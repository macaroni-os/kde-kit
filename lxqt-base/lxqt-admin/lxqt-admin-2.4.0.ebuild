# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="LXQt system administration tool"
HOMEPAGE="https://lxqt-project.org"
SRC_URI="https://api.github.com/repos/lxqt/lxqt-admin/tarball/2.4.0 -> lxqt-admin-2.4.0-8e7a589.tar.gz"
LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="*"
RDEPEND="dev-qt/qtbase:6[gui]
	kde-frameworks/kwindowsystem:6
	lxqt-base/liblxqt
	>=sys-auth/polkit-qt-0.175.0[qt6]
	
"
DEPEND="${RDEPEND}
	dev-util/lxqt-build-tools
	
"

post_src_unpack() {
	mv lxqt-lxqt-admin-* ${S}
}



# vim: filetype=ebuild
