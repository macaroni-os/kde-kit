# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Screenshot capture utility"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/spectacle-6.5.5.tar.xz -> spectacle-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="share"
RDEPEND="dev-qt/qtimageformats:6
	dev-qt/qtsvg:6
	kde-frameworks/kimageformats:6
	
"
DEPEND="${RDEPEND}
	dev-libs/wayland
	dev-qt/qtbase:6[gui,wayland,X]
	dev-qt/qtdeclarative:6
	dev-qt/qtmultimedia:6[qml]
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/kglobalaccel:6
	kde-frameworks/kguiaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kirigami:6
	kde-frameworks/knotifications:6
	kde-frameworks/kservice:6
	kde-frameworks/kstatusnotifieritem:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kwindowsystem:6[X]
	kde-frameworks/kxmlgui:6
	kde-frameworks/prison:6
	kde-plasma/kpipewire:6
	kde-plasma/layer-shell-qt:6
	media-libs/opencv:=
	x11-libs/libxcb
	x11-libs/libXrandr
	x11-libs/xcb-util
	x11-libs/xcb-util-cursor
	x11-libs/xcb-util-image
	share? ( kde-frameworks/purpose:6 )
	
"
src_prepare() {
	  kde6_src_prepare
}

src_configure() {
	  local mycmakeargs=(
	      $(cmake_use_find_package share KF6Purpose)
	  )
	  kde6_src_configure
}


# vim: filetype=ebuild
