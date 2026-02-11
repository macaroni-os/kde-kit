# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="KDE menu editor"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/kmenuedit-6.5.5.tar.xz -> kmenuedit-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="virtual/kde-seed[gui]
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6
	kde-frameworks/kservice:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	kde-frameworks/sonnet:6
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
