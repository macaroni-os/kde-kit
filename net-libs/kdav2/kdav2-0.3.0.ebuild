# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="forceoptional"
FRAMEWORKS_MINIMAL=5.60.0
QT_MINIMAL=5.12.3
inherit kde5

DESCRIPTION="KJob based DAV protocol implementation"
SRC_URI="mirror://kde/unstable/${PN}/${PV}/src/${P}.tar.xz"

LICENSE="GPL-2+"
SLOT="5"
KEYWORDS="*"

DEPEND="
	$(add_frameworks_dep kcoreaddons)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtxml)
	$(add_qt_dep qtxmlpatterns)
"
RDEPEND="${DEPEND}"

src_test() {
	# disable tests requiring net access, bug #680952
	local myctestargs=(
		-E "(kdav2-davcollectionfetchjob|kdav2-davcollectioncreatejob)"
	)

	kde5_src_test
}
