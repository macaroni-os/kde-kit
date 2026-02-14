# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake xdg

DESCRIPTION="Core library of PCManFM-Qt (Qt binding for libfm)"
HOMEPAGE="https://lxqt-project.org"
SRC_URI="https://api.github.com/repos/lxqt/libfm-qt/tarball/2.3.1 -> libfm-qt-2.3.1-40ee3c7.tar.gz"
LICENSE="BSD GPL-2+ LGPL-2.1+"
SLOT="0"
KEYWORDS="*"
RDEPEND="dev-libs/glib:2
	dev-qt/qtbase:6[gui,X]
	lxde-base/menu-cache
	lxqt-base/lxqt-menu-data
	media-libs/libexif
	x11-libs/libxcb
	
"
DEPEND="${RDEPEND}
	dev-util/lxqt-build-tools
	dev-qt/qttools:6[linguist]
	virtual/pkgconfig
	
"

post_src_unpack() {
	mv lxqt-libfm-qt-* ${S}
}



# vim: filetype=ebuild
