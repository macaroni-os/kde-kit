# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Flexible, composited Window Manager for windowing systems on Linux"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/kwin-x11-6.5.5.tar.xz -> kwin-x11-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="accessibility gles2-only lock +shortcuts systemd"
BDEPEND="dev-qt/qtbase:6[wayland]
	dev-util/wayland-scanner
	kde-frameworks/kcmutils:6
	
"
RDEPEND="!kde-plasma/kdeplasma-addons:5
	!<kde-plasma/kwin-6.3.80
	kde-frameworks/kirigami:6
	kde-frameworks/kitemmodels:6
	kde-plasma/aurorae:6
	kde-plasma/libplasma:6
	sys-apps/hwdata
	>=x11-base/xwayland-23.1.0
	
"
DEPEND="${RDEPEND}
	>=dev-libs/plasma-wayland-protocols-1.16.0
	>=dev-libs/wayland-1.23.0
	>=dev-libs/wayland-protocols-1.38
	dev-qt/qt5compat:6[qml]
	dev-qt/qtbase:6=[gles2-only=,gui,wayland,X]
	dev-qt/qtdeclarative:6
	dev-qt/qtsensors:6
	dev-qt/qtshadertools:6
	dev-qt/qtsvg:6
	dev-qt/qttools:6
	kde-frameworks/kauth:6
	kde-frameworks/kcmutils:6
	kde-frameworks/kcolorscheme:6
	kde-frameworks/kconfig:6[qml]
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/kdeclarative:6
	kde-frameworks/kglobalaccel:6
	kde-frameworks/kguiaddons:6[wayland]
	kde-frameworks/ki18n:6
	kde-frameworks/kidletime:6=[wayland]
	kde-frameworks/knewstuff:6
	kde-frameworks/knotifications:6
	kde-frameworks/kpackage:6
	kde-frameworks/kservice:6
	kde-frameworks/ksvg:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kwindowsystem:6=[wayland,X]
	kde-frameworks/kxmlgui:6
	kde-plasma/breeze:6
	kde-plasma/kdecoration:6
	kde-plasma/plasma-activities:6
	media-libs/fontconfig
	media-libs/freetype
	media-libs/lcms:2
	media-libs/libcanberra
	>=media-libs/libdisplay-info-0.2.0:=
	media-libs/libepoxy
	media-libs/libglvnd
	media-libs/mesa[X]
	virtual/libudev:=
	x11-base/xorg-proto
	x11-base/xorg-server
	x11-libs/libX11
	x11-libs/libXi
	>=x11-libs/libdrm-2.4.116
	>=x11-libs/libxcb-1.10:=
	>=x11-libs/libxkbcommon-1.5.0
	x11-libs/xcb-util-cursor
	x11-libs/xcb-util-image
	x11-libs/xcb-util-keysyms
	x11-libs/xcb-util-wm
	accessibility? ( media-libs/libqaccessibilityclient:6 )
	lock? ( kde-plasma/kscreenlocker:6 )
	shortcuts? ( kde-plasma/kglobalacceld:6 )
	
"
src_prepare() {
	      kde6_src_prepare
	       if ! use systemd; then
	              sed -e "s/^pkg_check_modules.*libsystemd/#&/" -i CMakeLists.txt || die
	      fi
}

src_configure() {
	      local mycmakeargs=(
	              $(cmake_use_find_package accessibility QAccessibilityClient6)
	              -DKWIN_BUILD_SCREENLOCKER=$(usex lock)
	              -DKWIN_BUILD_GLOBALSHORTCUTS=$(usex shortcuts)
	      )
	       kde6_src_configure
}


# vim: filetype=ebuild
