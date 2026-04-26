# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Qt implementation of freedesktop.org xdg specs"
HOMEPAGE="https://lxqt-project.org"
SRC_URI="https://api.github.com/repos/lxqt/libqtxdg/tarball/4.4.0 -> libqtxdg-4.4.0-d033d9e.tar.gz"
LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="*"
RDEPEND="dev-libs/glib:2
	dev-qt/qtbase:6[gui]
	dev-qt/qtsvg:6
	x11-misc/xdg-utils
	
"
DEPEND="${RDEPEND}
	dev-util/lxqt-build-tools
	virtual/pkgconfig
	
"

post_src_unpack() {
	mv lxqt-libqtxdg-* ${S}
}



# vim: filetype=ebuild
