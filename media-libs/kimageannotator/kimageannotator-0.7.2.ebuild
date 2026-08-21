# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="Tool for annotating images"
HOMEPAGE="https://github.com/ksnip/kImageAnnotator"
SRC_URI="https://api.github.com/repos/ksnip/kImageAnnotator/tarball/refs/tags/v0.7.2 -> kimageannotator-0.7.2-c481a89.tar.gz"
LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="*"
BDEPEND="dev-qt/qttools:6
	
"
RDEPEND="dev-qt/qtbase:6[gui]
	dev-qt/qtsvg:6
	media-libs/kcolorpicker
	x11-libs/libX11
	
"
DEPEND="${RDEPEND}
"

post_src_unpack() {
	mv ksnip-kImageAnnotator-* ${S}
}


src_configure() {
	local mycmakeargs=(
	  -DBUILD_TESTS=OFF
	  -DBUILD_WITH_QT6=ON
	)
	cmake_src_configure
}



# vim: filetype=ebuild
