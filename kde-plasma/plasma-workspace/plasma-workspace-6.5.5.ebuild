# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="KDE Plasma workspace"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/plasma-workspace-6.5.5.tar.xz -> plasma-workspace-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="appstream +calendar +fontconfig +ksysguard networkmanager +policykit screencast +semantic-desktop systemd telemetry test +wallpaper-metadata +X"
BDEPEND=">=dev-libs/plasma-wayland-protocols-1.18.0
	dev-libs/qcoro
	dev-qt/qtbase:6[wayland]
	>=dev-util/wayland-scanner-1.19.0
	kde-frameworks/kcmutils:6
	virtual/pkgconfig
	
"
RDEPEND="!kde-plasma/libkworkspace:5
	!<kde-plasma/plasma-desktop-6.3.80
	!<kde-plasma/xdg-desktop-portal-kde-6.1.90
	!kde-plasma/xembed-sni-proxy:*
	app-text/iso-codes
	dev-libs/kirigami-addons:6
	dev-qt/qttools:*
	kde-apps/kio-extras:6
	kde-frameworks/kirigami:6
	kde-frameworks/kquickcharts:6
	kde-plasma/kactivitymanagerd:6
	kde-plasma/milou:6
	kde-plasma/plasma-integration:6
	sys-apps/dbus
	x11-apps/xmessage
	x11-apps/xprop
	x11-apps/xrdb
	policykit? ( sys-apps/accountsservice )
	screencast? ( >=media-video/pipewire-0.3:* )
	
"
DEPEND="${RDEPEND}
	dev-libs/icu:=
	>=dev-libs/wayland-1.15
	dev-qt/qt5compat:6[qml]
	dev-qt/qtbase:6[gui,libinput,sql,sqlite,wayland]
	dev-qt/qtdeclarative:6
	dev-qt/qtlocation:6
	dev-qt/qtpositioning:6
	dev-qt/qtshadertools:6
	dev-qt/qtsvg:6
	kde-frameworks/karchive:6
	kde-frameworks/kauth:6
	kde-frameworks/kbookmarks:6
	kde-frameworks/kcmutils:6
	kde-frameworks/kcolorscheme:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/kdeclarative:6
	kde-frameworks/kded:6
	kde-frameworks/kglobalaccel:6
	kde-frameworks/kguiaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6
	kde-frameworks/kitemmodels:6
	kde-frameworks/kitemviews:6
	kde-frameworks/kjobwidgets:6
	kde-frameworks/knewstuff:6
	kde-frameworks/knotifications:6
	kde-frameworks/knotifyconfig:6
	kde-frameworks/kpackage:6
	kde-frameworks/kparts:6
	kde-frameworks/krunner:6
	kde-frameworks/kservice:6
	kde-frameworks/kstatusnotifieritem:6
	kde-frameworks/ksvg:6
	kde-frameworks/ktexteditor:6
	kde-frameworks/ktextwidgets:6
	kde-frameworks/kunitconversion:6
	kde-frameworks/kwallet:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kwindowsystem:6[X?]
	kde-frameworks/kxmlgui:6
	kde-frameworks/prison:6[qml]
	kde-frameworks/solid:6
	kde-plasma/breeze:6
	kde-plasma/kde-cli-tools:6
	kde-plasma/kwayland:6
	kde-plasma/kwin:6
	kde-plasma/layer-shell-qt:6
	kde-plasma/libkscreen:6
	kde-plasma/libplasma:6
	kde-plasma/plasma-activities:6
	kde-plasma/plasma-activities-stats:6
	kde-plasma/plasma5support:6
	media-libs/libcanberra
	>=media-libs/phonon-4.12.0[qt6(+)]
	sci-libs/libqalculate:=
	sys-apps/dbus
	sys-libs/zlib
	virtual/libudev:=
	appstream? ( >=dev-libs/appstream-1[qt] )
	calendar? ( kde-frameworks/kholidays:6 )
	ksysguard? ( kde-plasma/libksysguard:6 )
	policykit? ( sys-libs/libxcrypt:= )
	networkmanager? ( kde-frameworks/networkmanager-qt:6 )
	semantic-desktop? ( kde-frameworks/baloo:6 )
	systemd? ( sys-apps/systemd:= )
	telemetry? ( kde-frameworks/kuserfeedback:6 )
	wallpaper-metadata? ( kde-apps/libkexiv2:6 )
	X? (
	    dev-qt/qtbase:6[X]
	    kde-plasma/kscreenlocker:6
	    x11-libs/libICE
	    x11-libs/libSM
	    x11-libs/libX11
	    x11-libs/libXau
	    x11-libs/libxcb
	    x11-libs/libXcursor
	    x11-libs/libXfixes
	    x11-libs/libXtst
	    x11-libs/xcb-util
	    fontconfig? (
	        media-libs/fontconfig
	        x11-libs/libXft
	        x11-libs/xcb-util-image
	    )
	)
	
"
src_prepare() {
	  kde6_src_prepare
	  if ! use policykit; then
	      cmake_run_in kcms cmake_comment_add_subdirectory users
	  fi
	  if ! use fontconfig; then
	      ecm_punt_bogus_dep XCB IMAGE
	      sed -e "s/check_X11_lib(Xft)/#&/" -i CMakeLists.txt || die
	  fi
	  # TODO: try to get a build switch upstreamed
	  if ! use systemd; then
	      sed -e "s/^pkg_check_modules.*SYSTEMD/#&/" -i CMakeLists.txt || die
	  fi
}

src_configure() {
	  local mycmakeargs=(
	      -DWITH_X11=$(usex X)
	      -DCMAKE_DISABLE_FIND_PACKAGE_PackageKitQt6=ON
	      -DGLIBC_LOCALE_GEN=OFF
	      -DGLIBC_LOCALE_PREGENERATED=$(usex elibc_glibc)
	      $(cmake_use_find_package appstream AppStreamQt)
	      $(cmake_use_find_package calendar KF6Holidays)
	      $(cmake_use_find_package fontconfig Fontconfig)
	      $(cmake_use_find_package ksysguard KSysGuard)
	      $(cmake_use_find_package networkmanager KF6NetworkManagerQt)
	      -DBUILD_CAMERAINDICATOR=$(usex screencast)
	      $(cmake_use_find_package semantic-desktop KF6Baloo)
	      $(cmake_use_find_package telemetry KF6UserFeedback)
	      $(cmake_use_find_package wallpaper-metadata KExiv2Qt6)
	  )
	  kde6_src_configure
}

src_install() {
	  kde6_src_install
	  # default startup and shutdown scripts
	  insinto /etc/xdg/plasma-workspace/env
	  doins "${FILESDIR}"/10-agent-startup.sh
	  insinto /etc/xdg/plasma-workspace/shutdown
	  doins "${FILESDIR}"/10-agent-shutdown.sh
	  fperms +x /etc/xdg/plasma-workspace/shutdown/10-agent-shutdown.sh
}

pkg_postinst () {
	  xdg_pkg_postinst
	  elog "To enable gpg-agent and/or ssh-agent in Plasma sessions,"
	  elog "edit ${EPREFIX}/etc/xdg/plasma-workspace/env/10-agent-startup.sh"
	  elog "and ${EPREFIX}/etc/xdg/plasma-workspace/shutdown/10-agent-shutdown.sh"
}


# vim: filetype=ebuild
