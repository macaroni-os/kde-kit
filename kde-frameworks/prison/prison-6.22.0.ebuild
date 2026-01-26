# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit kde6

DESCRIPTION="QRCode and data matrix barcode library"
HOMEPAGE="https://invent.kde.org/frameworks/"
SRC_URI="https://download.kde.org/stable/frameworks/6.22/prison-6.22.0.tar.xz -> prison-6.22.0.tar.xz"
SLOT="6"
KEYWORDS="*"
IUSE="qml"
RDEPEND="dev-qt/qtbase:6[gui]
	dev-qt/qtmultimedia:6
	media-gfx/qrencode:=
	media-libs/libdmtx
	qml? ( dev-qt/qtdeclarative:6 )
	
"
DEPEND="${RDEPEND}
	
"
src_prepare() {
	  kde6_src_prepare
}

src_configure() {
	  local mycmakeargs=(
	      -DWITH_QUICK=$(usex qml)
	  )
	   kde6_src_configure
}


# vim: filetype=ebuild
