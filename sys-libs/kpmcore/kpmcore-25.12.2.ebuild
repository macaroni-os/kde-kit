# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Library for managing partitions"
HOMEPAGE="https://apps.kde.org/partitionmanager/"
SRC_URI="https://download.kde.org/stable/release-service/25.12.2/src/kpmcore-25.12.2.tar.xz -> kpmcore-25.12.2.tar.xz"
LICENSE="GPL-3"
SLOT="6"
KEYWORDS="*"
BDEPEND="virtual/pkgconfig
	
"
RDEPEND="virtual/kde-seed[gui]
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kwidgetsaddons:6
	sys-apps/util-linux
	sys-auth/polkit-qt
	
"
DEPEND="${RDEPEND}
"

# vim: filetype=ebuild
