# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="FUSE interface for KIO"
HOMEPAGE="https://github.com/KDE/kio-fuse"
SRC_URI="https://download.kde.org/stable/kio-fuse/kio-fuse-5.1.1.tar.xz -> kio-fuse-5.1.1.tar.xz"
LICENSE="GPL-3+"
SLOT="5"
KEYWORDS="*"
RDEPEND="dev-qt/qtbase:6[gui]
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kio:6
	
"
DEPEND="${RDEPEND}
"
src_configure() {
	local mycmakeargs=(
	  -DBUILD_WITH_QT6=ON
	)
	cmake_src_configure
}


# vim: filetype=ebuild
