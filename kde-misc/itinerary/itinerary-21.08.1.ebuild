# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="forceoptional"
FRAMEWORKS_MINIMAL=5.83.0
QT_MINIMAL=5.15.1
inherit eutils kde5

DESCRIPTION="Digital travel assistant with a priority on protecting your privacy"
HOMEPAGE="https://apps.kde.org/en/itinerary
https://www.volkerkrause.eu/2018/08/19/kde-itinerary-introduction.html"
SRC_URI="mirror://kde/stable/release-service/${PV}/src/${P}.tar.xz"
LICENSE="LGPL-2+"
SLOT="5"
KEYWORDS="*"
IUSE="+networkmanager"

DEPEND="
	>=dev-libs/kosmindoormap-$(ver_cut 1-3)
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtlocation)
	$(add_qt_dep qtpositioning)
	$(add_qt_dep qtquickcontrols2)
	$(add_qt_dep qtwidgets)
	$(add_kdeapps_dep kitinerary)
	$(add_kdeapps_dep kpkpass)
	$(add_frameworks_dep kcontacts)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep kholidays)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep knotifications)
	>=kde-misc/kpublictransport-$(ver_cut 1-3)
	sys-libs/zlib
	networkmanager? ( $(add_frameworks_dep networkmanager-qt) )
"
RDEPEND="${DEPEND}
	$(add_frameworks_dep kirigami)
	$(add_frameworks_dep prison)
"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package networkmanager KF5NetworkManagerQt)
	)
	kde5_src_configure
}

pkg_postinst() {
	if [[ -z "${REPLACING_VERSIONS}" ]]; then
		elog "Optional dependencies:"
		optfeature "screen brightness control to aid barcode scanning" "kde-frameworks/solid:5"
	fi
	kde5_pkg_postinst
}
