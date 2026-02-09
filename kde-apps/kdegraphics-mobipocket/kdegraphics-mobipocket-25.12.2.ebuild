# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Library to support mobipocket ebooks"
HOMEPAGE="https://invent.kde.org/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kdegraphics-mobipocket-25.12.2.tar.xz -> kdegraphics-mobipocket-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="virtual/kde-seed[gui]
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
