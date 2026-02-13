# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake xdg

DESCRIPTION="File manager and desktop icon manager (Qt port of PCManFM and libfm)"
HOMEPAGE="https://lxqt-project.org"
SRC_URI="https://api.github.com/repos/lxqt/pcmanfm-qt/tarball/2.3.0 -> pcmanfm-qt-2.3.0-c77e8e5.tar.gz"
LICENSE="GPL-2 GPL-2+ LGPL-2.1+"
SLOT="0"
KEYWORDS="*"
RDEPEND="dev-libs/glib:2
	dev-qt/qtbase:6[gui]
	kde-plasma/layer-shell-qt:6
	lxqt-base/lxqt-menu-data
	sys-apps/util-linux
	virtual/freedesktop-icon-theme
	x11-libs/libfm-qt
	x11-libs/libxcb
	x11-misc/xdg-utils
	
"
DEPEND="${RDEPEND}
	dev-util/lxqt-build-tools
	dev-qt/qttools:6[linguist]
	
"

post_src_unpack() {
	mv lxqt-pcmanfm-qt-* ${S}
}


pkg_postinst() {
	  xdg_desktop_database_update
	  xdg_icon_cache_update
}



# vim: filetype=ebuild
