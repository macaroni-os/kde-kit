# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional" # FIXME: Check back for doc in release
KDE_TEST="false"
KMNAME="akonadi-calendar-tools"
FRAMEWORKS_MINIMAL=5.75.0
QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="Tool to scan calendar data for buggy instances"

LICENSE="GPL-2+ handbook? ( FDL-1.2+ )"
SLOT="5"
KEYWORDS="*"
IUSE=""

DEPEND="
	$(add_qt_dep qtwidgets)
	$(add_kdeapps_dep akonadi)
	$(add_kdeapps_dep akonadi-calendar)
	$(add_kdeapps_dep calendarsupport)
	$(add_frameworks_dep kcalendarcore)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
"
RDEPEND="${DEPEND}"

src_prepare() {
	kde5_src_prepare

	cmake_comment_add_subdirectory doc konsolekalendar
	sed -i -e "/console\.categories/ s/^/#DONT/" CMakeLists.txt || die

	# delete colliding konsolekalendar translations
	rm -f po/*/konsolekalendar.po || die
	rm -rf po/*/docs/konsolekalendar || die
}
