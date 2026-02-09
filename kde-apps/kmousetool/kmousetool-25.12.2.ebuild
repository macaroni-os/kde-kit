# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="KDE program that clicks the mouse for you"
HOMEPAGE="https://apps.kde.org/kmousetool/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kmousetool-25.12.2.tar.xz -> kmousetool-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="virtual/kde-seed[gui,multimedia]
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kstatusnotifieritem:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kwindowsystem:6[X]
	kde-frameworks/kxmlgui:6
	x11-libs/libX11
	x11-libs/libXtst
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
