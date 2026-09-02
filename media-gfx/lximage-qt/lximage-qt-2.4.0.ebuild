# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake xdg

DESCRIPTION="The image viewer and screenshot tool for lxqt"
HOMEPAGE="https://lxqt-project.org"
SRC_URI="https://api.github.com/repos/lxqt/lximage-qt/tarball/2.4.0 -> lximage-qt-2.4.0-6ee442f.tar.gz"
LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="*"
RDEPEND="dev-libs/glib:2
	dev-qt/qtbase:6[gui]
	dev-qt/qtsvg:6
	media-libs/libexif
	x11-libs/libfm-qt
	x11-libs/libX11
	x11-libs/libXfixes
	
"
DEPEND="${RDEPEND}
	dev-util/lxqt-build-tools
	dev-qt/qttools:6[linguist]
	virtual/pkgconfig
	
"

post_src_unpack() {
	mv lxqt-lximage-qt-* ${S}
}



# vim: filetype=ebuild
