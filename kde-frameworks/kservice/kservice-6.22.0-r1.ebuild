# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="Advanced plugin and service introspection"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/kservice-6.22.0.tar.xz -> kservice-6.22.0.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="+man"
BDEPEND="man? ( kde-frameworks/kdoctools:6 )
	
"
RDEPEND="dev-qt/qtbase:6
	kde-frameworks/kconfig:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/ki18n:6
	
"
DEPEND="${RDEPEND}
	test? ( dev-qt/qtbase:6 )
	
"
src_prepare() {
	  kde6_src_prepare
}

src_configure() {
	  local mycmakeargs=(
	      $(cmake_use_find_package man KF6DocTools)
	  )
	   kde6_src_configure
}


# vim: filetype=ebuild
