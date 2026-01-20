# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Core components for KDE Activities System"
HOMEPAGE="https://invent.kde.org/plasma/"
SRC_URI="https://download.kde.org/stable/plasma/6.5.5/plasma-activities-6.5.5.tar.xz -> plasma-activities-6.5.5.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="dev-qt/qtbase:6[gui,sql]
	dev-qt/qtdeclarative:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	
"
DEPEND="${RDEPEND}
	dev-libs/boost
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
