# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Monitor system sensors, process information and other system resources"
HOMEPAGE="https://apps.kde.org/plasma-systemmonitor/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/plasma-systemmonitor-6.5.5.tar.xz -> plasma-systemmonitor-6.5.5.tar.xz"
LICENSE="|| ( GPL-3 GPL-2 )"
SLOT="6"
KEYWORDS="*"
RDEPEND="kde-frameworks/kirigami:6
	kde-frameworks/kitemmodels:6
	kde-frameworks/kquickcharts:6
	kde-plasma/ksystemstats:6
	
"
DEPEND="${RDEPEND}
	>=dev-libs/kirigami-addons-1.1.0:6
	dev-qt/qtbase:6[gui]
	dev-qt/qtdeclarative:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/kglobalaccel:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6
	kde-frameworks/kitemmodels:6
	kde-frameworks/knewstuff:6
	kde-frameworks/kpackage:6
	kde-frameworks/kservice:6
	kde-frameworks/kwindowsystem:6
	kde-plasma/libksysguard:6
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
