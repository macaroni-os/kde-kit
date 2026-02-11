# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="KDE color selector/editor"
HOMEPAGE="https://apps.kde.org/kcolorchooser/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kcolorchooser-25.12.2.tar.xz -> kcolorchooser-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="virtual/kde-seed[gui]
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kxmlgui:6
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
