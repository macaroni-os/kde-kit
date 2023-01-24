# Distributed under the terms of the GNU General Public License v2

EAPI=7

COMMIT=50ac0509891343bc01a0aeffda5a44a1e65d9d04
EGIT_BRANCH="frameworks"
KDE_HANDBOOK="forceoptional"
FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.12.3
inherit kde5

DESCRIPTION="Tool for editing color palettes"
HOMEPAGE="https://userbase.kde.org/KColorEdit"
SRC_URI="https://github.com/KDE/${PN}/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"

DEPEND="
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kactivities)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdelibs4support)
	$(add_frameworks_dep kguiaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep ktextwidgets)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kxmlgui)
"
RDEPEND="${DEPEND}
	!media-gfx/kcoloredit:4
"

S="${WORKDIR}/${PN}-${COMMIT}"
