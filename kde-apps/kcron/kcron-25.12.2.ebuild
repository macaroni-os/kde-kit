# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="KDE Task Scheduler"
HOMEPAGE="https://apps.kde.org/kcron/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kcron-25.12.2.tar.xz -> kcron-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="virtual/cron
	
"
DEPEND="${RDEPEND}
	dev-libs/kirigami-addons:6
	dev-qt/qtbase:6[gui]
	dev-qt/qtdeclarative:6
	kde-frameworks/kauth:6
	kde-frameworks/kcmutils:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kwidgetsaddons:6
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
