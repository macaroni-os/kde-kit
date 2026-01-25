# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 optfeature xdg

DESCRIPTION="KDE Plasma desktop"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/plasma-desktop-6.5.5.tar.xz -> plasma-desktop-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="ibus input_devices_wacom scim screencast sdl +semantic-desktop webengine"
BDEPEND="dev-util/intltool
	kde-frameworks/kcmutils:6
	virtual/pkgconfig
	x11-base/xorg-server
	x11-drivers/xf86-input-libinput
	input_devices_wacom? ( dev-util/wayland-scanner )
	
"
RDEPEND="!<kde-plasma/plasma-workspace-6.0.80
	dev-libs/kirigami-addons:6
	kde-frameworks/kirigami:6
	kde-frameworks/qqc2-desktop-style:6
	kde-plasma/oxygen:6
	media-fonts/noto-emoji
	sys-apps/util-linux
	x11-apps/setxkbmap
	x11-misc/xdg-user-dirs
	screencast? ( kde-plasma/kpipewire:6 )
	webengine? ( >=net-libs/signon-oauth2-0.25_p20210102[qt6(+)] )
	
"
DEPEND="${RDEPEND}
	dev-qt/qt5compat:6[qml]
	dev-qt/qtbase:6[gui,sql,wayland]
	dev-qt/qtdeclarative:6
	dev-qt/qtsvg:6
	kde-frameworks/attica:6
	kde-frameworks/karchive:6
	kde-frameworks/kauth:6
	kde-frameworks/kbookmarks:6
	kde-frameworks/kcmutils:6
	kde-frameworks/kcodecs:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
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
	kde-frameworks/ksvg:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kwindowsystem:6[X]
	kde-frameworks/kxmlgui:6
	kde-frameworks/solid:6
	kde-frameworks/sonnet:6
	kde-plasma/kwin:6
	kde-plasma/libksysguard:6
	kde-plasma/libplasma:6
	kde-plasma/plasma-activities:6
	kde-plasma/plasma-activities-stats:6
	kde-plasma/plasma-workspace:6[screencast?,X]
	kde-plasma/plasma5support:6
	media-libs/libcanberra
	x11-libs/libX11
	x11-libs/libxcb
	x11-libs/libXcursor
	x11-libs/libXi
	x11-libs/libxkbcommon
	x11-libs/libxkbfile
	ibus? (
	    app-i18n/ibus
	    dev-libs/glib:2
	    x11-libs/xcb-util-keysyms
	)
	input_devices_wacom? (
	    dev-libs/wayland
	    dev-libs/libwacom:=
	)
	scim? ( app-i18n/scim )
	sdl? ( media-libs/libsdl2[joystick] )
	semantic-desktop? ( kde-frameworks/baloo:6 )
	webengine? (
	    kde-apps/kaccounts-integration:6
	    >=net-libs/accounts-qt-1.17[qt6(+)]
	)
	
"
src_prepare() {
	  kde6_src_prepare
	  if ! use ibus; then
	      sed -e "s/XCB_XCB_FOUND AND XCB_KEYSYMS_FOUND/false/" \
	          -i applets/kimpanel/backend/ibus/CMakeLists.txt || die
	  fi
	  # TODO: try to get a build switch upstreamed
	  if ! use scim; then
	      sed -e "s/^pkg_check_modules.*SCIM/#&/" -i CMakeLists.txt || die
	  fi
}

src_configure() {
	  local mycmakeargs=(
	      -DBUILD_KCM_MOUSE_X11=ON
	      -DBUILD_KCM_TOUCHPAD_X11=ON
	      -DCMAKE_DISABLE_FIND_PACKAGE_PackageKitQt6=ON
	      $(cmake_use_find_package ibus GLIB2)
	      -DBUILD_KCM_TABLET=$(usex input_devices_wacom)
	      $(cmake_use_find_package sdl SDL2)
	      $(cmake_use_find_package semantic-desktop KF6Baloo)
	      $(cmake_use_find_package webengine AccountsQt6)
	      $(cmake_use_find_package webengine KAccounts6)
	  )
	  kde6_src_configure
}

src_install() {
	  kde6_src_install
}

pkg_postinst() {
	  if [[ -z "${REPLACING_VERSIONS}" ]]; then
	      optfeature "screen reader support" "app-accessibility/orca"
	  fi
	  xdg_pkg_postinst
}


# vim: filetype=ebuild
