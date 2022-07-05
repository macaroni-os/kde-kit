# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="forceoptional"
FRAMEWORKS_MINIMAL=5.82.0
QT_MINIMAL=5.15.2
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Plugin-based system monitoring daemon"
LICENSE="LGPL-3+"
SLOT="5"
KEYWORDS="*"
IUSE="lm-sensors networkmanager"

DEPEND="
	dev-libs/libnl
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtnetwork)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep solid)
	$(add_plasma_dep libksysguard)
	net-libs/libpcap
	sys-libs/libcap
	virtual/libudev:=
	lm-sensors? ( sys-apps/lm_sensors:= )
	networkmanager? ( $(add_frameworks_dep networkmanager-qt) )
"
RDEPEND="${DEPEND}
	!<kde-plasma/ksysguard-5.21.90:5
"

src_configure() {
	local mycmakeargs=(
		$(cmake_use_find_package lm-sensors Sensors)
		$(cmake_use_find_package networkmanager KF5NetworkManagerQt)
	)
	kde5_src_configure
}