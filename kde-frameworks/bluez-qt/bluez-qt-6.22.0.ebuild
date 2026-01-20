# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Qt wrapper for Bluez 5 DBus API"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/bluez-qt-6.22.0.tar.xz -> bluez-qt-6.22.0.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="dev-qt/qtbase:6
	dev-qt/qtdeclarative:6
	
"
DEPEND="${RDEPEND}
	
"
src_test() {
	  # parallel tests fail, bug 609248
	  kde6_src_test -j1
}


# vim: filetype=ebuild
