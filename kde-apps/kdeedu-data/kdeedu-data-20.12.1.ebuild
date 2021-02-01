# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit kde5

DESCRIPTION="Shared icons, artwork and data files for educational applications"

LICENSE="GPL-2"
SLOT="5"
KEYWORDS="*"
IUSE=""

BDEPEND="
	$(add_qt_dep qtcore)
	kde-frameworks/extra-cmake-modules:5
"
