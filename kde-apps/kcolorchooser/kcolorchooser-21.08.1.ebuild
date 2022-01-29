# Distributed under the terms of the GNU General Public License v2

EAPI=7

FRAMEWORKS_MINIMAL=5.75.0
QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="KDE color selector/editor"
HOMEPAGE="https://apps.kde.org/en/kcolorchooser"
LICENSE="MIT"
SLOT="5"
KEYWORDS="*"
IUSE=""

DEPEND="
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kxmlgui)
"
RDEPEND="${DEPEND}"