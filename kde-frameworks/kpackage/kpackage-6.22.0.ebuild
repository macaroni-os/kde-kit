# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Framework to install and load packages of non binary content"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/kpackage-6.22.0.tar.xz -> kpackage-6.22.0.tar.xz"
LICENSE="GPL-2"
SLOT="6"
KEYWORDS="*"
IUSE="man"
BDEPEND="man? ( kde-frameworks/kdoctools:6 )
	
"
RDEPEND="virtual/kde-seed
	kde-frameworks/karchive:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	
"
DEPEND="${RDEPEND}
"
src_configure() {
	local mycmakeargs=(
	  $(cmake_use_find_package man KF6DocTools)
	)
	cmake_src_configure
}


# vim: filetype=ebuild
