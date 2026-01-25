# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Plasma library and runtime components based upon KF6 and Qt6"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/libplasma-6.5.5.tar.xz -> libplasma-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="gles2-only"
RDEPEND="!${CATEGORY}/${PN}:5[-kf6compat(-)]
	
"
DEPEND="${RDEPEND}
	dev-qt/qtbase:6[gles2-only=,gui,X]
	dev-qt/qtdeclarative:6
	dev-qt/qtsvg:6
	>=dev-libs/wayland-1.15.0
	kde-frameworks/karchive:6
	kde-frameworks/kcolorscheme:6
	kde-frameworks/kconfig:6[qml]
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kglobalaccel:6
	kde-frameworks/kguiaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6
	kde-frameworks/kirigami:6
	kde-frameworks/knotifications:6
	kde-frameworks/kpackage:6
	kde-frameworks/ksvg:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kwindowsystem:6[X]
	kde-plasma/plasma-activities:6
	media-libs/libglvnd
	x11-libs/libX11
	x11-libs/libxcb
	!gles2-only? ( media-libs/libglvnd[X] )
	
"
src_prepare() {
	  kde6_src_prepare
}

src_configure() {
	  local mycmakeargs=(
	      $(cmake_use_find_package !gles2-only OpenGL)
	  )
	  kde6_src_configure
}


# vim: filetype=ebuild
