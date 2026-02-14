# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Qt wrapper for ModemManager DBus API"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/modemmanager-qt-6.22.0.tar.xz -> modemmanager-qt-6.22.0.tar.xz"
LICENSE="GPL-2"
SLOT="6"
KEYWORDS="*"
RDEPEND="virtual/kde-seed
	>=net-misc/modemmanager-0.7.991
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
