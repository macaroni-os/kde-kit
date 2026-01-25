# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Library for parsing RSS and Atom feeds"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/syndication-6.22.0.tar.xz -> syndication-6.22.0.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="dev-qt/qtbase:6
	kde-frameworks/kcodecs:6
	
"
DEPEND="${RDEPEND}
	test? ( dev-qt/qtbase:6 )
	
"

# vim: filetype=ebuild
