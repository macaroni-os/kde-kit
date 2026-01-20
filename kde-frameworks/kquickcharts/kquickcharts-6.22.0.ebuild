# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="QtQuick plugin providing high-performance charts"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/kquickcharts-6.22.0.tar.xz -> kquickcharts-6.22.0.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="examples"
RDEPEND="examples? ( !kde-frameworks/kquickcharts:5[examples(-)] )
	
"
DEPEND="${RDEPEND}
	dev-qt/qtbase:6[gui]
	dev-qt/qtdeclarative:6
	dev-qt/qtshadertools:6
	examples? (
	    dev-qt/qtbase:6
	    kde-frameworks/kdeclarative:6
	    kde-frameworks/kirigami:6
	)
	
"
src_prepare() {
	  kde6_src_prepare
}

src_configure() {
	  local mycmakeargs=(
	      -DBUILD_EXAMPLES=$(usex examples)
	  )
	   kde6_src_configure
}


# vim: filetype=ebuild
