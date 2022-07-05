# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_QTHELP="false"
QT_MINIMAL=5.15.2
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Framework providing a common interface for KParts that can play media files"
LICENSE="MIT"
KEYWORDS="*"
IUSE=""

DEPEND="
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kparts)
	$(add_frameworks_dep kxmlgui)
"
RDEPEND="${DEPEND}"
