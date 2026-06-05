# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Files needed for the LXQt Wayland Session"
HOMEPAGE="https://lxqt-project.org"
SRC_URI="https://api.github.com/repos/lxqt/lxqt-wayland-session/tarball/0.3.2 -> lxqt-wayland-session-0.3.2-be88bc4.tar.gz"
LICENSE="BSD CC-BY-SA-4.0 GPL-2 GPL-3 LGPL-2.1 MIT"
SLOT="0"
KEYWORDS="*"
RDEPEND="app-misc/qtxdg-tools
	kde-plasma/layer-shell-qt:6
	lxqt-base/lxqt-session
	x11-misc/xdg-user-dirs
	
"
DEPEND="${RDEPEND}
	dev-util/lxqt-build-tools
	dev-qt/qttools:6[linguist]
	virtual/pkgconfig
	
"

post_src_unpack() {
	mv lxqt-lxqt-wayland-session-* ${S}
}


pkg_postinst() {
	  einfo "By default, the labwc compositor will be used."
	  einfo "To use something else, define, for example, the following in '.config/lxqt/session.conf':"
	  einfo "    compositor=kwin_wayland"
	  einfo ""
	  einfo "For more configuration details, and a list of supported compositors, see:"
	  einfo "    /usr/share/doc/${P}/README*"
}



# vim: filetype=ebuild
