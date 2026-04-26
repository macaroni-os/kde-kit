# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Crossplatform tool for creating screenshots."
HOMEPAGE="https://lxqt-project.org"
SRC_URI="https://api.github.com/repos/lxqt/screengrab/tarball/3.2.0 -> screengrab-3.2.0-1fc2d35.tar.gz"
LICENSE="GPL-2 GPL-2+ LGPL-2.1+"
SLOT="0"
KEYWORDS="*"
RDEPEND="dev-libs/libqtxdg
	dev-libs/wayland
	dev-qt/qtbase:6[gui]
	dev-qt/qtwayland:6
	kde-frameworks/kwindowsystem:6[X]
	kde-plasma/layer-shell-qt:6
	x11-libs/libX11
	x11-libs/libxcb
	
"
DEPEND="${RDEPEND}
	dev-util/lxqt-build-tools
	dev-qt/qttools:6[linguist]
	
"

post_src_unpack() {
	mv lxqt-screengrab-* ${S}
}



# vim: filetype=ebuild
