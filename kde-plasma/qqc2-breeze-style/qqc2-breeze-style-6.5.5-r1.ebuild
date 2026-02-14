# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Breeze inspired QQC2 Style"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/qqc2-breeze-style-6.5.5.tar.xz -> qqc2-breeze-style-6.5.5.tar.xz"
LICENSE="|| ( GPL-2+ LGPL-3+ ) CC0-1.0"
SLOT="6"
KEYWORDS="*"
RDEPEND="virtual/kde-seed[gui,declarative]
	kde-frameworks/kcolorscheme:6
	kde-frameworks/kconfig:6
	kde-frameworks/kguiaddons:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kirigami:6
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
