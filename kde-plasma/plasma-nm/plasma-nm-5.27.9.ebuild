# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="true"
FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.15.2
inherit kde5

DESCRIPTION="KDE Plasma applet for NetworkManager"
LICENSE="GPL-2 LGPL-2.1"
SLOT="5"
KEYWORDS="*"
IUSE="openconnect teamd"

DEPEND="
	>=app-crypt/qca-2.3.0:2
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtdeclarative widgets)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep kcmutils)
	$(add_frameworks_dep kdeclarative)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kitemviews)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep kwallet)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kwindowsystem)
	$(add_frameworks_dep kxmlgui)
	$(add_frameworks_dep networkmanager-qt teamd=)
	$(add_frameworks_dep plasma)
	$(add_frameworks_dep solid)
	net-misc/networkmanager[teamd=]
	$(add_qt_dep qtxml)
	$(add_frameworks_dep modemmanager-qt)
	net-misc/mobile-broadband-provider-info
	openconnect? (
		$(add_qt_dep qtxml)
		net-vpn/networkmanager-openconnect
		net-vpn/openconnect:=
	)
"
RDEPEND="${DEPEND}
	$(add_qt_dep qtquickcontrols)
	$(add_qt_dep qtquickcontrols2)
	$(add_frameworks_dep kirigami)
	$(add_plasma_dep kde-cli-tools)
"
BDEPEND="virtual/pkgconfig"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package openconnect OpenConnect)
	)

	kde5_src_configure
}

pkg_postinst() {
	kde5_pkg_postinst

	if ! has_version "kde-plasma/plasma-workspace:5"; then
		elog "${PN} is not terribly useful without kde-plasma/plasma-workspace:5."
		elog "However, the networkmanagement KCM can be called from either systemsettings"
		elog "or manually: $ kcmshell5 kcm_networkmanagement"
	fi
}
