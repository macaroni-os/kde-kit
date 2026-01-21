# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Qt wrapper for NetworkManager API"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/networkmanager-qt-6.22.0.tar.xz -> networkmanager-qt-6.22.0.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="teamd"
RDEPEND="dev-qt/qtbase:6
	>=net-misc/networkmanager-1.4.0-r1[teamd?]
	
"
DEPEND="${RDEPEND}
	test? ( dev-qt/qtbase:6 )
	
"

# vim: filetype=ebuild
