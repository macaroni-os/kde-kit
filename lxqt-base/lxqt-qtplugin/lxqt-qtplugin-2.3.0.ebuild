# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="LXQt Qt platform integration plugin"
HOMEPAGE="https://lxqt-project.org"
SRC_URI="https://api.github.com/repos/lxqt/lxqt-qtplugin/tarball/2.3.0 -> lxqt-qtplugin-2.3.0-6f6d7d6.tar.gz"
LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="*"
RDEPEND="dev-libs/libdbusmenu-lxqt
	dev-libs/libqtxdg
	dev-qt/qtbase:6[gui]
	x11-libs/libfm-qt
	
"
DEPEND="${RDEPEND}
	dev-util/lxqt-build-tools
	dev-qt/qttools:6[linguist]
	
"

post_src_unpack() {
	mv lxqt-lxqt-qtplugin-* ${S}
}



# vim: filetype=ebuild
