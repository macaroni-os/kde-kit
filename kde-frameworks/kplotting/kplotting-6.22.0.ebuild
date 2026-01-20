# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Framework providing easy data-plotting functions"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/kplotting-6.22.0.tar.xz -> kplotting-6.22.0.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="dev-qt/qtbase:6[gui]
	
"
DEPEND="${RDEPEND}
	
"

# vim: filetype=ebuild
