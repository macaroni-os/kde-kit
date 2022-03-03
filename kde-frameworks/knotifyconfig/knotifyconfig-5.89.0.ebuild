# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="false"
QT_MINIMAL=5.15.2
inherit kde5

DESCRIPTION="Framework for configuring desktop notifications"
LICENSE="LGPL-2+"
KEYWORDS="*"
IUSE="phonon"

DEPEND="
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	!phonon? ( media-libs/libcanberra )
	phonon? ( >=media-libs/phonon-4.11.0[qt5(+)] )
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package !phonon Canberra)
	)
	kde5_src_configure
}