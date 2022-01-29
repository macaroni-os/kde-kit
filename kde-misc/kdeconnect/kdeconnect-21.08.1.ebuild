# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="optional"
KDE_TEST="true"
KDE_SELINUX_MODULE="${PN}"
FRAMEWORKS_MINIMAL=5.83.0
QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="Adds communication between KDE Plasma and your smartphone"
HOMEPAGE="https://kdeconnect.kde.org/
https://apps.kde.org/en/kdeconnect.kcm"
SRC_URI="mirror://kde/stable/release-service/${PV}/src/${PN}-kde-${PV}.tar.xz"
LICENSE="GPL-2+"
SLOT="5"
KEYWORDS="*"
IUSE="bluetooth pulseaudio wayland X"

DEPEND="
	>=app-crypt/qca-2.3.0:2[ssl]
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtmultimedia)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kcmutils)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kirigami)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep kpeople)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep plasma)
	$(add_frameworks_dep solid)
	bluetooth? ( $(add_qt_dep qtbluetooth) )
	X? (
		$(add_qt_dep qtx11extras)
		x11-libs/libfakekey
		x11-libs/libX11
		x11-libs/libXtst
	)
	pulseaudio? ( media-libs/pulseaudio-qt )
	wayland? ( $(add_frameworks_dep kwayland) )
"
RDEPEND="${DEPEND}
	dev-libs/kpeoplevcard
	$(add_qt_dep qtgraphicaleffects)
	$(add_qt_dep qtmultimedia)[qml]
	$(add_qt_dep qtquickcontrols2)
	$(add_frameworks_dep kdeclarative)
	net-fs/sshfs
"

RESTRICT+=" test"

S="${WORKDIR}/${PN}-kde-${PV}"

src_configure() {
	local mycmakeargs=(
		-DBLUETOOTH_ENABLED=$(usex bluetooth)
		$(cmake-utils_use_find_package pulseaudio KF5PulseAudioQt)
		$(cmake-utils_use_find_package wayland KF5Wayland)
		$(cmake-utils_use_find_package X LibFakeKey)
	)

	kde5_src_configure
}

pkg_postinst(){
	kde5_pkg_postinst

	elog "The Android .apk file is available via"
	elog "https://play.google.com/store/apps/details?id=org.kde.kdeconnect_tp"
	elog "or via"
	elog "https://f-droid.org/packages/org.kde.kdeconnect_tp/"
}
