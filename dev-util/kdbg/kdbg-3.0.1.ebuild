# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="true"
FRAMEWORKS_MINIMAL=5.60.0
QT_MINIMAL=5.12.3
inherit kde5

DESCRIPTION="Graphical debugger interface"
HOMEPAGE="https://www.kdbg.org/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="5"
KEYWORDS="*"
IUSE=""

DEPEND="
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kwindowsystem)
	$(add_frameworks_dep kxmlgui)
"
RDEPEND="${DEPEND}
	sys-devel/gdb
"

src_prepare() {
	# allow documentation to be handled by eclass
	mv kdbg/doc . || die
	sed -i -e '/add_subdirectory(doc)/d' kdbg/CMakeLists.txt || die
	echo "add_subdirectory ( doc ) " >> CMakeLists.txt || die

	kde5_src_prepare
}
