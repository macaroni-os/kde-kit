# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6 xdg

DESCRIPTION="Language learning application that helps improving pronunciation skills"
HOMEPAGE="https://apps.kde.org/artikulate/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/artikulate-25.12.2.tar.xz -> artikulate-25.12.2.tar.xz"
SLOT="6"
KEYWORDS="*"
RDEPEND="kde-apps/kdeedu-data:6
	
"
DEPEND="${RDEPEND}
	dev-qt/qtbase:6[gui,sql]
	dev-qt/qtdeclarative:6
	dev-qt/qtmultimedia:6
	kde-frameworks/karchive:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/ki18n:6
	kde-frameworks/knewstuff:6
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
