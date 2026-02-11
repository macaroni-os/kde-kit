# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="QtQuick plugin providing high-performance charts"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/kquickcharts-6.22.0.tar.xz -> kquickcharts-6.22.0.tar.xz"
LICENSE="GPL-2"
SLOT="6"
KEYWORDS="*"
IUSE="examples"
RDEPEND="virtual/kde-seed[gui,declarative]
	dev-qt/qtshadertools:6
	examples? (
	    kde-frameworks/kdeclarative:6
	    kde-frameworks/kirigami:6
	)
	
"
DEPEND="${RDEPEND}
"
src_configure() {
	local mycmakeargs=(
	  -DBUILD_EXAMPLES=$(usex examples)
	)
	cmake_src_configure
}


# vim: filetype=ebuild
