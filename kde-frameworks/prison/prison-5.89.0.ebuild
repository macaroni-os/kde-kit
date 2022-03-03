# Distributed under the terms of the GNU General Public License v2

EAPI=7

QT_MINIMAL=5.15.2
inherit kde5

DESCRIPTION="QRCode and data matrix barcode library"
HOMEPAGE="https://invent.kde.org/frameworks/prison"

LICENSE="GPL-2"
KEYWORDS="*"
IUSE="qml"

RDEPEND="
	$(add_qt_dep qtgui)
	media-gfx/qrencode:=
	media-libs/libdmtx
	media-libs/zxing-cpp
	qml? ( $(add_qt_dep qtdeclarative) )
"
DEPEND="${RDEPEND}
	test? ( $(add_qt_dep qtwidgets) )
"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package qml Qt5Quick)
	)

	kde5_src_configure
}
