# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit cmake

DESCRIPTION="QRCode and data matrix barcode library"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/prison-6.22.0.tar.xz -> prison-6.22.0.tar.xz"
LICENSE="GPL-2"
SLOT="6"
KEYWORDS="*"
IUSE="qml"
RDEPEND="virtual/kde-seed[gui,multimedia]
	media-gfx/qrencode:=
	media-libs/libdmtx
	qml? ( dev-qt/qtdeclarative:6 )
	
"
DEPEND="${RDEPEND}
"
src_configure() {
	local mycmakeargs=(
	  -DWITH_QUICK=$(usex qml)
	)
	cmake_src_configure
}


# vim: filetype=ebuild
