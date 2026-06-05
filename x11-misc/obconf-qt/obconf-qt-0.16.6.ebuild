# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake xdg

DESCRIPTION="The Qt port of obconf, the Openbox configuration tool"
HOMEPAGE="https://lxqt-project.org"
SRC_URI="https://api.github.com/repos/lxqt/obconf-qt/tarball/0.16.6 -> obconf-qt-0.16.6-2dde658.tar.gz"
LICENSE="GPL-2 GPL-2+"
SLOT="0"
KEYWORDS="*"
RDEPEND="dev-libs/glib:2
	dev-libs/libxml2
	dev-qt/qtbase:6[gui]
	x11-libs/libX11
	x11-wm/openbox:3
	
"
DEPEND="${RDEPEND}
	dev-util/lxqt-build-tools
	dev-qt/qttools:6[linguist]
	virtual/pkgconfig
	
"

post_src_unpack() {
	mv lxqt-obconf-qt-* ${S}
}



# vim: filetype=ebuild
