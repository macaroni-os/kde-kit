# Distributed under the terms of the GNU General Public License v2

EAPI=7

ECM_TEST="forceoptional"
QT_MINIMAL=5.12.3
inherit kde5

DESCRIPTION="API to manage the serial connection between the computer and 3D Printers"
SRC_URI="mirror://kde/stable/${PN}/${PV}/${P}.tar.xz"
HOMEPAGE="https://atelier.kde.org/"

LICENSE="|| ( LGPL-2.1+ LGPL-3 ) gui? ( GPL-3+ )"
SLOT="0"
KEYWORDS="*"
IUSE="doc gui test"

BDEPEND="
	$(add_qt_dep linguist-tools)
	doc? ( app-doc/doxygen[dot] )
"
DEPEND="
	$(add_qt_dep qtserialport)
	gui? (
		$(add_qt_dep qtcharts)
		$(add_qt_dep qtgui)
		$(add_qt_dep qtwidgets)
	)
"
RDEPEND="${DEPEND}"

src_prepare() {
	kde5_src_prepare

	sed -e "s/${PN}/${PF}/" -i doc/CMakeLists.txt || die

	use gui || punt_bogus_dep Qt5 Charts
	use test || cmake_comment_add_subdirectory unittests
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_DOCS=$(usex doc)
		-DBUILD_TEST_GUI=$(usex gui)
	)

	kde5_src_configure
}
