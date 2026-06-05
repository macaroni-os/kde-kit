# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="A backend implementation for xdg-desktop-portal"
HOMEPAGE="https://lxqt-project.org"
SRC_URI="https://api.github.com/repos/lxqt/xdg-desktop-portal-lxqt/tarball/1.3.0 -> xdg-desktop-portal-lxqt-1.3.0-cf4e5af.tar.gz"
LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="*"
RDEPEND="dev-qt/qtbase:6[gui]
	kde-frameworks/kwindowsystem:6
	sys-apps/xdg-desktop-portal
	x11-libs/libfm-qt
	
"
DEPEND="${RDEPEND}
	dev-util/lxqt-build-tools
	
"

post_src_unpack() {
	mv lxqt-xdg-desktop-portal-lxqt-* ${S}
}



# vim: filetype=ebuild
