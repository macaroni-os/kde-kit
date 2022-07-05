# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="forceoptional"
QT_MINIMAL=5.15.1
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Framework for searching and managing metadata"
LICENSE="LGPL-2+"
KEYWORDS="*"
IUSE=""

DEPEND="
	>=dev-db/lmdb-0.9.17
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kcrash)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep kfilemetadata)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kidletime)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep solid)
"
RDEPEND="${DEPEND}"

RESTRICT+=" test" # bug 624250