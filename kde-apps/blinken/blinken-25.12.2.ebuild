# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Memory enhancement game based on Simon Says"
HOMEPAGE="https://apps.kde.org/blinken/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/blinken-25.12.2.tar.xz -> blinken-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="virtual/kde-seed[gui,svg]
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/kguiaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kxmlgui:6
	media-libs/phonon[qt6(+)]
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
