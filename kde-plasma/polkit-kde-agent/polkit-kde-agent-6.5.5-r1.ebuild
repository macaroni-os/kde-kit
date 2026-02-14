# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="PolKit agent module for KDE Plasma"
HOMEPAGE="https://kde.org/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/polkit-kde-agent-1-6.5.5.tar.xz -> polkit-kde-agent-6.5.5.tar.xz"
LICENSE="GPL-2"
SLOT="6"
KEYWORDS="*"
RDEPEND="virtual/kde-seed[gui,declarative]
	dev-qt/qt5compat:6[qml]
	kde-frameworks/kirigami:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/knotifications:6
	kde-frameworks/kwindowsystem:6[X]
	kde-plasma/libplasma:6
	>=sys-auth/polkit-qt-0.175[qt6(+)]
	
"
DEPEND="${RDEPEND}
"
S="${WORKDIR}/${PN}-1-${PV}"

# vim: filetype=ebuild
