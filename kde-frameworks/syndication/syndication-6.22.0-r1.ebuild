# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Library for parsing RSS and Atom feeds"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/syndication-6.22.0.tar.xz -> syndication-6.22.0.tar.xz"
LICENSE="GPL-2"
SLOT="6"
KEYWORDS="*"
RDEPEND="virtual/kde-seed
	kde-frameworks/kcodecs:6
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
