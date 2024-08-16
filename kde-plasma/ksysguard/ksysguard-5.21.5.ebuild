# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.15.1
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Network-enabled task manager and system monitor"

LICENSE="GPL-2+"
SLOT="5"
KEYWORDS="*"
IUSE="lm-sensors networkmanager"

DEPEND="
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtxml)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kinit)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kitemviews)
	$(add_frameworks_dep knewstuff)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kwindowsystem)
	$(add_frameworks_dep kxmlgui)
	$(add_plasma_dep libksysguard)
	$(add_plasma_dep libksysguard)
	lm-sensors? ( sys-apps/lm-sensors:= )
	dev-libs/libnl:3
	net-libs/libpcap
	sys-libs/libcap
	networkmanager? ( $(add_frameworks_dep networkmanager-qt) )
"
RDEPEND="${DEPEND}"

src_prepare() {
	# Fix memcpy error
	sed -i '/^#include <iostream>/a #include <cstring>\n' plugins/process/network/helper/ConnectionMapping.cpp || die

	kde5_src_prepare
}

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package lm-sensors Sensors)
		$(cmake-utils_use_find_package networkmanager KF5NetworkManagerQt)
	)

	kde5_src_configure
}

src_install() {
	kde5_src_install

	rm \
			"${ED}"/usr/bin/kstatsviewer \
			"${ED}"/usr/bin/ksystemstats \
			"${ED}"/usr/share/dbus-1/services/org.kde.ksystemstats.service \
			"${ED}"/usr/lib64/libexec/ksysguard/ksgrd_network_helper \
			"${ED}"/usr/lib64/qt5/plugins/ksysguard/process/ksysguard_plugin_network.so \
			"${ED}"/usr/lib64/qt5/plugins/ksysguard/process/ksysguard_plugin_nvidia.so || die
}
