# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Visual end user components for Kirigami-based applications"
HOMEPAGE="https://invent.kde.org/libraries/kirigami-addons"
SRC_URI="https://download.kde.org/stable/kirigami-addons/kirigami-addons-1.11.0.tar.xz -> kirigami-addons-1.11.0.tar.xz"
LICENSE="|| ( GPL-2 GPL-3 LGPL-3 ) LGPL-2.1+"
SLOT="6"
KEYWORDS="*"
# Commons depends
CDEPEND="dev-qt/qtbase:6[gui]
	dev-qt/qtdeclarative:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kconfig:6
	kde-frameworks/kglobalaccel:6
	kde-frameworks/kguiaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kirigami:6
	
"
RDEPEND="${CDEPEND}
	dev-qt/qtmultimedia:6[qml]
	kde-frameworks/qqc2-desktop-style:6
	kde-plasma/libplasma:6
	
"
DEPEND="${CDEPEND}
	
"

# vim: filetype=ebuild
