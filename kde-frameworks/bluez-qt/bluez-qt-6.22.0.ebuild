# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Qt wrapper for Bluez 5 DBus API"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/bluez-qt-6.22.0.tar.xz -> bluez-qt-6.22.0.tar.xz"
LICENSE="GPL-2"
SLOT="6"
KEYWORDS="*"
RDEPEND="virtual/kde-seed[declarative]
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
