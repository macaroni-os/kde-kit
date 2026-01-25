# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Kill the bots or they kill you!"
HOMEPAGE="https://apps.kde.org/killbots/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.1/src/killbots-25.12.1.tar.xz -> killbots-25.12.1.tar.xz"
SLOT="6"
KEYWORDS="*"
BDEPEND="app-alternatives/gzip
	
"
RDEPEND="dev-qt/qtbase:6[gui]
	kde-apps/libkdegames:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	
"
DEPEND="${RDEPEND}
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
