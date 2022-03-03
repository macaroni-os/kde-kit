# Distributed under the terms of the GNU General Public License v2

EAPI=7

FRAMEWORKS_MINIMAL=5.75.0
QT_MINIMAL=5.15.2
inherit kde5

DESCRIPTION="Library for embedding KParts in a Kontact component"
HOMEPAGE="https://api.kde.org/kdepim/kontactinterface/html/index.html"
LICENSE="GPL-2+ LGPL-2.1+"
SLOT="5"
KEYWORDS="*"
IUSE=""

DEPEND="
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtxml)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kparts)
	$(add_frameworks_dep kwindowsystem)
	$(add_frameworks_dep kxmlgui)
"
RDEPEND="${DEPEND}"