# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Library providing utility functions for the handling of calendar data"
HOMEPAGE="https://api.kde.org/kdepim/kcalutils/html/index.html"
SRC_URI="https://download.kde.org/stable/release-service/25.12.1/src/kcalutils-25.12.1.tar.xz -> kcalutils-25.12.1.tar.xz"
SLOT="6"
KEYWORDS="*"
RESTRICT="test"
RDEPEND="dev-qt/qtbase:6[gui]
	kde-apps/kidentitymanagement:6=
	kde-frameworks/kcalendarcore:6
	kde-frameworks/kcodecs:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/ktexttemplate:6
	kde-frameworks/kwidgetsaddons:6
	
"
DEPEND="${RDEPEND}
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
