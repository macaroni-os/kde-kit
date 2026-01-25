# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Oxygen visual style for the Plasma desktop"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/oxygen-6.5.5.tar.xz -> oxygen-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="qt5 X"
RDEPEND="!<kde-plasma/libplasma-6.1.90:*[-kf6compat(-)]
	dev-qt/qtsvg:6
	
"
DEPEND="${RDEPEND}
	dev-qt/qtbase:6[gui]
	dev-qt/qtdeclarative:6
	kde-frameworks/frameworkintegration:6
	kde-frameworks/kcmutils:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kguiaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kservice:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kwindowsystem:6
	kde-plasma/kdecoration:6
	kde-plasma/libplasma:6
	qt5? (
	    >=dev-qt/qtdbus-5.15.12:5
	    >=dev-qt/qtdeclarative-5.15.12:5
	    >=dev-qt/qtgui-5.15.12:5
	    >=dev-qt/qtwidgets-5.15.12:5
	    >=kde-frameworks/frameworkintegration-5.115.0:5
	    >=kde-frameworks/kcompletion-5.115.0:5
	    >=kde-frameworks/kconfig-5.115.0:5
	    >=kde-frameworks/kconfigwidgets-5.115.0:5
	    >=kde-frameworks/kcoreaddons-5.115.0:5
	    >=kde-frameworks/kguiaddons-5.115.0:5
	    >=kde-frameworks/ki18n-5.115.0:5
	    >=kde-frameworks/kwidgetsaddons-5.115.0:5
	    >=kde-frameworks/kwindowsystem-5.115.0:5
	    X? ( >=dev-qt/qtx11extras-5.15.12:5 )
	)
	X? (
	    dev-qt/qtbase:6[gui]
	    x11-libs/libxcb
	)
	
"
src_prepare() {
	  kde6_src_prepare
}

src_configure() {
	  local mycmakeargs=(
	      -DBUILD_QT6=ON
	      -DBUILD_QT5=$(usex qt5)
	      $(cmake_use_find_package X XCB)
	  )
	  kde6_src_configure
}


# vim: filetype=ebuild
