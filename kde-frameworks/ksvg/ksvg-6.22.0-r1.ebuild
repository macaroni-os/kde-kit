# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Components for handling SVGs"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/ksvg-6.22.0.tar.xz -> ksvg-6.22.0.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="dev-qt/qtbase:6[gui]
	dev-qt/qtdeclarative:6
	dev-qt/qtsvg:6
	kde-frameworks/karchive:6
	kde-frameworks/kcolorscheme:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kguiaddons:6
	kde-frameworks/kirigami:6
	
"
DEPEND="${RDEPEND}
	
"

# vim: filetype=ebuild
