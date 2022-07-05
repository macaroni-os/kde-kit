# Distributed under the terms of the GNU General Public License v2

EAPI=7

FRAMEWORKS_MINIMAL=5.89.0
QT_MINIMAL=5.15.2
inherit kde5

DESCRIPTION="Integrate Chrome/Firefox better into Plasma through browser extensions"
LICENSE="GPL-3+"
SLOT="5"
KEYWORDS="*"
IUSE=""

DEPEND="
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kactivities)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep kfilemetadata)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep krunner)
	$(add_frameworks_dep purpose)
	$(add_plasma_dep plasma-workspace)
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DMOZILLA_DIR="${EPREFIX}/usr/$(get_libdir)/mozilla"
	)

	kde5_src_configure
}