# Distributed under the terms of the GNU General Public License v2

EAPI=7

FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.15.2
inherit kde5

DESCRIPTION="Plasma applet and services for creating encrypted vaults"
HOMEPAGE+=" https://cukic.co/2017/02/03/vaults-encryption-in-plasma/"
LICENSE="LGPL-3"
SLOT="5"
KEYWORDS="*"
IUSE="networkmanager"

DEPEND="
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kactivities)
	$(add_frameworks_dep kcodecs)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep plasma)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_plasma_dep libksysguard)
	networkmanager? ( $(add_frameworks_dep networkmanager-qt) )
"
RDEPEND="${DEPEND}
	$(add_qt_dep qtquickcontrols2)
	|| ( >=sys-fs/cryfs-0.9.9 >=sys-fs/encfs-1.9.2 )
"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package networkmanager KF5NetworkManagerQt)
	)

	kde5_src_configure
}