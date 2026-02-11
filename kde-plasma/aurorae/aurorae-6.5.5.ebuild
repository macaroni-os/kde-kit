# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Themeable window decoration for KWin"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/aurorae-6.5.5.tar.xz -> aurorae-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="virtual/kde-seed[gui,declarative]
	dev-qt/qttools:6
	kde-frameworks/kirigami:6
	kde-frameworks/ksvg:6
	kde-frameworks/kcmutils:6
	kde-frameworks/kcolorscheme:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/knewstuff:6
	kde-frameworks/kpackage:6
	kde-plasma/kdecoration:6
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
