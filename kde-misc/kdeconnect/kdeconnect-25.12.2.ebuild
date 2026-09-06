# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake xdg

DESCRIPTION="Adds communication between KDE Plasma and your smartphone"
HOMEPAGE="https://kdeconnect.kde.org/ https://apps.kde.org/kdeconnect/"
SRC_URI="https://download.kde.org/Attic//release-service/25.12.2/src/kdeconnect-kde-25.12.2.tar.xz -> kdeconnect-kde-25.12.2.tar.xz"
LICENSE="|| ( GPL-2 GPL-3 ) LGPL-2.1+ BSD-2 CC0-1.0 MIT"
SLOT="6"
KEYWORDS="*"
IUSE="+bluetooth modemmanager +pulseaudio X"
RDEPEND="virtual/kde-seed[declarative,gui,multimedia,svg,wayland]
	dev-qt/qtmultimedia:6[qml]
	dev-qt/qtwayland:6
	dev-libs/kirigami-addons:6
	dev-libs/kpeoplevcard:6
	dev-libs/libei
	dev-libs/libevdev
	dev-libs/openssl:0=
	dev-libs/wayland
	kde-frameworks/kcolorscheme:6
	kde-frameworks/kcmutils:6
	kde-frameworks/kconfig:6[qml]
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/kdeclarative:6
	kde-frameworks/kguiaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6
	kde-frameworks/kirigami:6
	kde-frameworks/kitemmodels:6
	kde-frameworks/knotifications:6
	kde-frameworks/kpackage:6
	kde-frameworks/kpeople:6
	kde-frameworks/kservice:6
	kde-frameworks/kstatusnotifieritem:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kwindowsystem:6
	kde-frameworks/qqc2-desktop-style:6
	kde-frameworks/solid:6
	kde-plasma/libplasma:6
	net-fs/sshfs
	sys-apps/dbus
	x11-libs/libxkbcommon
	bluetooth? ( dev-qt/qtconnectivity:6 )
	modemmanager? ( kde-frameworks/modemmanager-qt:6 )
	pulseaudio? ( media-libs/pulseaudio-qt:6 )
	X? (
	  x11-libs/libfakekey
	  x11-libs/libX11
	  x11-libs/libXtst
	)
	
"
DEPEND="${RDEPEND}
	dev-libs/wayland-protocols
	
"
S="${WORKDIR}/kdeconnect-kde-25.12.2"
src_prepare() {
	cmake_src_prepare
}
src_configure() {
	local mycmakeargs=(
		-DBUILD_TESTING=OFF
		-DBLUETOOTH_ENABLED=$(usex bluetooth)
		-DWITH_PULSEAUDIO=$(usex pulseaudio)
		-DWITH_X11=$(usex X)
		-DINSTALL_UFW_APPLICATION_RULE=OFF
		$(cmake_use_find_package modemmanager KF6ModemManagerQt)
	)
	cmake_src_configure
}
pkg_postinst() {
	xdg_pkg_postinst

	elog "The Android companion app is available via"
	elog "https://play.google.com/store/apps/details?id=org.kde.kdeconnect_tp"
	elog "or via"
	elog "https://f-droid.org/packages/org.kde.kdeconnect_tp/"
}


# vim: filetype=ebuild
