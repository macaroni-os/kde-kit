# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="true"
FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.15.2
inherit kde5
SRC_URI="https://github.com/KDE/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
DESCRIPTION="Data Model and Extraction System for Travel Reservation information"
HOMEPAGE="https://invent.kde.org/libraries/kosmindoormap"
LICENSE="LGPL-2+"
SLOT="5"
KEYWORDS="*"
IUSE=""

BDEPEND="
	sys-devel/bison
	sys-devel/flex
"
COMMON_DEPEND="
	dev-libs/protobuf:=
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetwork)
	$(add_frameworks_dep ki18n)
	>=kde-misc/kpublictransport-$(ver_cut 1-3):5
	sys-libs/zlib
"
DEPEND="${COMMON_DEPEND}
	test? ( $(add_qt_dep qtwidgets) )
"
RDEPEND="${COMMON_DEPEND}
	$(add_qt_dep qtquickcontrols2)
"

src_configure() {
	local mycmakeargs=(
		-DCMAKE_DISABLE_FIND_PACKAGE_OsmTools=ON # we have no use for it
	)
	kde5_src_configure
}
