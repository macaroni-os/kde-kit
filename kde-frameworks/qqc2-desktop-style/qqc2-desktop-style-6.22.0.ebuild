# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Style for QtQuickControls2 that uses QWidget's QStyle for painting"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/qqc2-desktop-style-6.22.0.tar.xz -> qqc2-desktop-style-6.22.0.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="dev-qt/qtbase:6[gui]
	dev-qt/qtdeclarative:6
	kde-frameworks/kcolorscheme:6
	kde-frameworks/kconfig:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kirigami:6
	kde-frameworks/sonnet:6
	
"
DEPEND="${RDEPEND}
	kde-frameworks/kcoreaddons:6
	
"

# vim: filetype=ebuild
