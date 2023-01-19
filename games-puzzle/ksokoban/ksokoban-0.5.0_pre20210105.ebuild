# Distributed under the terms of the GNU General Public License v2

EAPI=7

COMMIT="092e2b90b3375ac5cf515d8314e4c076a1d051c8"
KDE_HANDBOOK="forceoptional"
inherit kde5

DESCRIPTION="The japanese warehouse keeper game"
HOMEPAGE="https://invent.kde.org/games/ksokoban"
SRC_URI="https://github.com/KDE/${PN}/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"

RDEPEND="
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kxmlgui)
"
DEPEND="${RDEPEND}
	$(add_frameworks_dep kiconthemes)
"

S="${WORKDIR}/${PN}-${COMMIT}"
