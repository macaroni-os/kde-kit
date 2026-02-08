# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Application to enable/disable qCDebug"
HOMEPAGE="https://apps.kde.org/kdebugsettings/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kdebugsettings-25.12.2.tar.xz -> kdebugsettings-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
RESTRICT="test"
RDEPEND="dev-qt/qtbase:6[gui]
	kde-frameworks/kcompletion:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kitemviews:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kxmlgui:6
	
"
DEPEND="${RDEPEND}
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
