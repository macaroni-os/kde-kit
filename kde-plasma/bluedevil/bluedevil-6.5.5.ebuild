# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Bluetooth stack for KDE Plasma"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/bluedevil-6.5.5.tar.xz -> bluedevil-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
BDEPEND="kde-frameworks/kcmutils:6
	
"
RDEPEND="kde-frameworks/kirigami:6
	
"
DEPEND="${RDEPEND}
	dev-qt/qtbase:6[gui]
	dev-qt/qtdeclarative:6
	kde-frameworks/bluez-qt:6
	kde-frameworks/kcmutils:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kjobwidgets:6
	kde-frameworks/knotifications:6
	kde-frameworks/kservice:6
	kde-frameworks/ksvg:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kwindowsystem:6[X]
	kde-plasma/libplasma:6
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
