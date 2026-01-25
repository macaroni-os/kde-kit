# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Potato game for kids by KDE"
HOMEPAGE="https://apps.kde.org/ktuberling/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.1/src/ktuberling-25.12.1.tar.xz -> ktuberling-25.12.1.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="dev-qt/qtbase:6[gui]
	dev-qt/qtmultimedia:6
	dev-qt/qtsvg:6
	kde-apps/libkdegames:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	
"
DEPEND="${RDEPEND}
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
