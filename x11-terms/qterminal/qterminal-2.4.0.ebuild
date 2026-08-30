# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake xdg

DESCRIPTION="A lightweight Qt-based terminal emulator"
HOMEPAGE="https://lxqt-project.org"
SRC_URI="https://api.github.com/repos/lxqt/qterminal/tarball/2.4.0 -> qterminal-2.4.0-b936477.tar.gz"
LICENSE="GPL-2 GPL-2+"
SLOT="0"
KEYWORDS="*"
RDEPEND="dev-qt/qtbase:6[gui,X]
	kde-plasma/layer-shell-qt:6
	media-libs/libcanberra
	x11-libs/libX11
	x11-libs/qtermwidget
	
"
DEPEND="${RDEPEND}
	dev-util/lxqt-build-tools
	
"

post_src_unpack() {
	mv lxqt-qterminal-* ${S}
}



# vim: filetype=ebuild
