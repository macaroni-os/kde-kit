# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Shared icons, artwork and data files for educational applications"
HOMEPAGE="https://invent.kde.org/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.1/src/kdeedu-data-25.12.1.tar.xz -> kdeedu-data-25.12.1.tar.xz"
SLOT="6"
KEYWORDS="*"
BDEPEND="dev-qt/qtbase:6
	>=kde-frameworks/extra-cmake-modules-6.0:0
	
"
DEPEND="dev-qt/qtbase:6
	>=kde-frameworks/extra-cmake-modules-6.0:0
	
"
src_prepare() {
	  kde6_src_prepare
}


# vim: filetype=ebuild
