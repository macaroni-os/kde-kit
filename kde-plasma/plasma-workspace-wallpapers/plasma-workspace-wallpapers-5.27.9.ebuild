# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit kde5

DESCRIPTION="Wallpapers for the Plasma workspace"
LICENSE="GPL-2"
SLOT="5"
KEYWORDS="*"
IUSE=""

BDEPEND="
	$(add_qt_dep qtcore)
	$(add_frameworks_dep extra-cmake-modules)
"