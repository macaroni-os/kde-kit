# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="KDE Japanese dictionary and reference"
HOMEPAGE="https://apps.kde.org/kiten/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kiten-25.12.2.tar.xz -> kiten-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="media-fonts/kanjistrokeorders
	
"
DEPEND="${RDEPEND}
	dev-qt/qtbase:6[gui]
	kde-frameworks/karchive:6
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/knotifications:6
	kde-frameworks/kparts:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
