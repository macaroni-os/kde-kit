# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Monitors S.M.A.R.T. capable devices for imminent failure"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/plasma-disks-6.5.5.tar.xz -> plasma-disks-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="sys-apps/smartmontools
	
"
DEPEND="${RDEPEND}
	dev-qt/qtbase:6[gui]
	dev-qt/qtdeclarative:6
	kde-frameworks/kauth:6[policykit]
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/knotifications:6
	kde-frameworks/kservice:6
	kde-frameworks/solid:6
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
