# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="KDE Plasma screen management"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/kscreen-6.5.5.tar.xz -> kscreen-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
BDEPEND="kde-frameworks/kcmutils:6
	
"
RDEPEND="virtual/kde-seed[gui,declarative,svg]
	kde-frameworks/kirigami:6
	kde-frameworks/kcmutils:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/kglobalaccel:6
	kde-frameworks/ki18n:6
	kde-frameworks/ksvg:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	kde-plasma/libkscreen:6
	kde-plasma/libplasma:6
	x11-libs/libxcb
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
