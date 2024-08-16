# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="forceoptional"
QT_MINIMAL=5.15.1
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="DAV protocol implemention with KJobs"
LICENSE="LGPL-2+"
KEYWORDS="*"
IUSE=""

DEPEND="
	$(add_qt_dep qtgui)
	$(add_qt_dep qtxml)
	$(add_qt_dep qtxmlpatterns)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
"
RDEPEND="${DEPEND}
	!kde-apps/kdav:5
"

src_test() {
	# bug 616808 - DavItemFetchJobTest requires D-Bus
	# bug 653602 - DavItemsListJobTest mimetypes unsupported
	local myctestargs=(
		-E "(kdav-davitemfetchjob|kdav-davitemslistjob)"
	)
	kde5_src_test
}