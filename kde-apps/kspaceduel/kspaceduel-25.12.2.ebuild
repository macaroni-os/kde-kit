# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Space Game by KDE"
HOMEPAGE="https://apps.kde.org/kspaceduel/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kspaceduel-25.12.2.tar.xz -> kspaceduel-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="virtual/kde-seed[gui,svg]
	kde-apps/libkdegames:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kxmlgui:6
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
