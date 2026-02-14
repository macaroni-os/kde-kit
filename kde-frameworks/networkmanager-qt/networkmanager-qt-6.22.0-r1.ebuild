# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Qt wrapper for NetworkManager API"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/networkmanager-qt-6.22.0.tar.xz -> networkmanager-qt-6.22.0.tar.xz"
LICENSE="GPL-2"
SLOT="6"
KEYWORDS="*"
IUSE="teamd"
RDEPEND="virtual/kde-seed
	net-misc/networkmanager[teamd?]
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
