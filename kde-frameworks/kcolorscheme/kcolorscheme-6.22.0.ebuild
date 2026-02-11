# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Framework for downloading and sharing additional application data"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/kcolorscheme-6.22.0.tar.xz -> kcolorscheme-6.22.0.tar.xz"
LICENSE="GPL-2"
SLOT="6"
KEYWORDS="*"
RDEPEND="virtual/kde-seed[gui,declarative]
	kde-frameworks/kconfig:6
	kde-frameworks/ki18n:6
	kde-frameworks/kguiaddons:6
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
