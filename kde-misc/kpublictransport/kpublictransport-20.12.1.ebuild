# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="true"
FRAMEWORKS_MINIMAL=5.74.0
QT_MINIMAL=5.15.2
inherit kde5

DESCRIPTION="Library for accessing public transport timetables and other information"
HOMEPAGE="https://invent.kde.org/libraries/kpublictransport
	https://www.volkerkrause.eu/2019/03/02/kpublictransport-introduction.html"
SRC_URI="mirror://kde/stable/release-service/${PV}/src/${P}.tar.xz"

LICENSE="LGPL-2+"
SLOT="5"
KEYWORDS="*"
IUSE=""

RDEPEND="
	dev-libs/protobuf:=
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetwork)
	sys-libs/zlib
"
DEPEND="${RDEPEND}
	test? ( $(add_qt_dep qtwidgets) )
"

src_configure() {
	local mycmakeargs=(
		-DCMAKE_DISABLE_FIND_PACKAGE_OsmTools=ON # we have no use for it
	)
	kde5_src_configure
}
