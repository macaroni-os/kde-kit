# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Support components for porting from KF5/Qt5 to KF6/Qt6"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/plasma5support-6.5.5.tar.xz -> plasma5support-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="!kde-plasma/plasma-workspace:5
	!<kde-plasma/plasma-workspace-6.4.90:6
	
"
DEPEND="${RDEPEND}
	dev-qt/qtbase:6[gui]
	dev-qt/qtdeclarative:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kguiaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	kde-frameworks/knotifications:6
	kde-frameworks/kservice:6
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
