# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit kde5

DESCRIPTION="Qt-based client-side and server-side SOAP component"
HOMEPAGE="https://www.kdab.com/development-resources/qt-tools/kd-soap/"
SRC_URI="https://github.com/KDAB/KDSoap/releases/download/${P}/${P}.tar.gz"

LICENSE="GPL-3 AGPL-3"
SLOT="0/1"
KEYWORDS="*"
IUSE=""

RDEPEND="
	$(add_qt_dep qtcore)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtxml)
"
DEPEND="${RDEPEND}
	dev-libs/boost
"

src_prepare() {
	kde5_src_prepare
	sed -e "/install.*INSTALL_DOC_DIR/d" -i CMakeLists.txt || die
}

src_configure() {
	local mycmakeargs=(
		-DKDSoap_EXAMPLES=OFF # no install targets
	)
	kde5_src_configure
}
