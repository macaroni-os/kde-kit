# Distributed under the terms of the GNU General Public License v2

EAPI=7

QT_MINIMAL=5.15.1
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Framework for providing different actions given a string query"
LICENSE="LGPL-2+"
KEYWORDS="*"
IUSE=""

DEPEND="
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep plasma)
	$(add_frameworks_dep solid)
	$(add_frameworks_dep threadweaver)
"
RDEPEND="${DEPEND}"

src_test() {
	# requires virtual dbus #630672
	local myctestargs=(
		-E "(dbusrunnertest)"
	)
	kde5_src_test
}