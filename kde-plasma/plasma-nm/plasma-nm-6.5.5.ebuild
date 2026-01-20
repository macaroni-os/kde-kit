# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="KDE Plasma applet for NetworkManager"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/plasma-nm-6.5.5.tar.xz -> plasma-nm-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="openconnect teamd"
BDEPEND="kde-frameworks/kcmutils:6
	virtual/pkgconfig
	
"
RDEPEND="kde-frameworks/kdeclarative:6
	kde-frameworks/kirigami:6
	kde-frameworks/kquickcharts:6
	
"
DEPEND="${RDEPEND}
	>=app-crypt/qca-2.3.7:2[qt6(+)]
	dev-libs/qcoro[dbus]
	dev-qt/qtbase:6[gui]
	dev-qt/qtdeclarative:6
	kde-frameworks/kcolorscheme:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kitemviews:6
	kde-frameworks/knotifications:6
	kde-frameworks/kservice:6
	kde-frameworks/ksvg:6
	kde-frameworks/kwallet:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kwindowsystem:6
	kde-frameworks/kxmlgui:6
	kde-frameworks/modemmanager-qt:6
	kde-frameworks/networkmanager-qt:6[teamd=]
	kde-frameworks/solid:6
	kde-plasma/libplasma:6
	net-misc/mobile-broadband-provider-info
	net-misc/networkmanager[teamd=]
	openconnect? (
	    dev-qt/qtwebengine:6
	    net-vpn/networkmanager-openconnect
	    net-vpn/openconnect:=
	)
	
"
src_prepare() {
	  kde6_src_prepare
}

src_configure() {
	  local mycmakeargs=(
	      -DBUILD_OPENCONNECT=$(usex openconnect)
	  )
	  kde6_src_configure
}


# vim: filetype=ebuild
