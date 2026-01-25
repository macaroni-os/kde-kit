# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Useful applications for Plasma development"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/plasma-sdk-6.5.5.tar.xz -> plasma-sdk-6.5.5.tar.xz"
LICENSE="GPL-2"
SLOT="6"
KEYWORDS="*"
RDEPEND="dev-qt/qt5compat:6[qml]
	kde-frameworks/kirigami:6
	
"
DEPEND="${RDEPEND}
	dev-qt/qtbase:6[gui]
	dev-qt/qtdeclarative:6
	kde-frameworks/karchive:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcolorscheme:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6
	kde-frameworks/kitemmodels:6
	kde-frameworks/kpackage:6
	kde-frameworks/ksvg:6
	kde-frameworks/ktexteditor:6
	kde-frameworks/kwidgetsaddons:6
	kde-plasma/libplasma:6
	kde-plasma/plasma5support:6
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
