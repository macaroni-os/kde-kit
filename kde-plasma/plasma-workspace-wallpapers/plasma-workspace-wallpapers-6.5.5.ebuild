# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Wallpapers for the Plasma workspace"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/plasma-workspace-wallpapers-6.5.5.tar.xz -> plasma-workspace-wallpapers-6.5.5.tar.xz"
LICENSE="GPL-2"
SLOT="6"
KEYWORDS="*"
BDEPEND="dev-qt/qtbase:6
	kde-frameworks/extra-cmake-modules:0
	
"

# vim: filetype=ebuild
