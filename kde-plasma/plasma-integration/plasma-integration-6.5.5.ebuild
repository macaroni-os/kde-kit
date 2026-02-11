# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake xdg

DESCRIPTION="Qt Platform Theme integration plugins for the Plasma workspaces"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/plasma-integration-6.5.5.tar.xz -> plasma-integration-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="qt5 wayland"
RDEPEND="virtual/kde-seed[declarative,gui,wayland?,X]
	kde-frameworks/qqc2-desktop-style:6
	kde-frameworks/kcolorscheme:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kguiaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6
	kde-frameworks/knotifications:6
	kde-frameworks/kstatusnotifieritem:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kwindowsystem:6[wayland,X]
	kde-frameworks/kxmlgui:6
	kde-plasma/breeze:6
	media-libs/fontconfig
	media-libs/freetype
	x11-libs/libX11
	x11-libs/libxcb
	x11-libs/xcb-util-cursor
	qt5? (
	    >=dev-qt/qtdbus-5.15.12:5
	    >=dev-qt/qtgui-5.15.12:5[X]
	    >=dev-qt/qtquickcontrols2-5.15.12:5
	    >=dev-qt/qtwayland-5.15.12:5
	    >=dev-qt/qtwidgets-5.15.12:5
	    >=dev-qt/qtx11extras-5.15.12:5
	    >=kde-frameworks/kcolorscheme-5.115.0:5
	    >=kde-frameworks/kconfig-5.115.0:5
	    >=kde-frameworks/kconfigwidgets-5.115.0:5
	    >=kde-frameworks/kcoreaddons-5.115.0:5
	    >=kde-frameworks/kguiaddons-5.115.0:5
	    >=kde-frameworks/ki18n-5.115.0:5
	    >=kde-frameworks/kiconthemes-5.115.0:5
	    >=kde-frameworks/kio-5.115.0:5
	    >=kde-frameworks/knotifications-5.115.0:5
	    >=kde-frameworks/kwidgetsaddons-5.115.0:5
	    >=kde-frameworks/kwindowsystem-5.115.0:5[X]
	    >=kde-frameworks/kxmlgui-5.115.0:5
	    >=kde-plasma/breeze-${PV}:5[-kf6compat(-)]
	)
	
"
DEPEND="${RDEPEND}
"
src_prepare() {
	cmake_src_prepare
}
src_configure() {
	local mycmakeargs=(
	  -DBUILD_QT6=ON
	  -DBUILD_QT5=$(usex qt5)
	)
	cmake_src_configure
}


# vim: filetype=ebuild
