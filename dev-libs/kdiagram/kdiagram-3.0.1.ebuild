# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Powerful libraries (KChart, KGantt) for creating business diagrams"
HOMEPAGE="https://invent.kde.org/graphics/kdiagram"
SRC_URI="https://download.kde.org/stable/kdiagram/3.0.1/kdiagram-3.0.1.tar.xz -> kdiagram-3.0.1.tar.xz"
LICENSE="GPL-2"
SLOT="6"
KEYWORDS="*"
IUSE="examples test"
REQUIRED_USE="test? ( examples )"
RDEPEND="dev-qt/qtbase:6[gui]
	dev-qt/qtsvg:6
	dev-qt/qttools:6
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
