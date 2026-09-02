# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="The LXQt notification daemon"
HOMEPAGE="https://lxqt-project.org"
SRC_URI="https://api.github.com/repos/lxqt/lxqt-notificationd/tarball/2.4.0 -> lxqt-notificationd-2.4.0-5aca407.tar.gz"
LICENSE="LGPL-2.1 LGPL-2.1+"
SLOT="0"
KEYWORDS="*"
RDEPEND="dev-libs/libqtxdg
	dev-qt/qtbase:6[gui]
	kde-frameworks/kwindowsystem:6
	kde-plasma/layer-shell-qt:6
	lxqt-base/liblxqt
	
"
DEPEND="${RDEPEND}
	dev-util/lxqt-build-tools
	dev-qt/qttools:6[linguist]
	
"

post_src_unpack() {
	mv lxqt-lxqt-notificationd-* ${S}
}



# vim: filetype=ebuild
