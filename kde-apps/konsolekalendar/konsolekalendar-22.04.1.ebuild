# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
KMNAME="akonadi-calendar-tools"
FRAMEWORKS_MINIMAL=5.94.0
inherit kde5

DESCRIPTION="Command line interface to KDE calendars"
HOMEPAGE+=" https://userbase.kde.org/KonsoleKalendar"

LICENSE="GPL-2+ handbook? ( FDL-1.2+ )"
SLOT="5"
KEYWORDS="*"
IUSE=""

DEPEND="
	$(add_kdeapps_dep akonadi)
	$(add_kdeapps_dep akonadi-calendar)
	$(add_kdeapps_dep calendarsupport)
	$(add_kdeapps_dep kcalutils)
	$(add_frameworks_dep kcalendarcore)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
"
RDEPEND="${DEPEND}"

src_prepare() {
	kde5_src_prepare

	# delete colliding calendarjanitor translations
	rm -f po/*/calendarjanitor.po || die

	cmake_comment_add_subdirectory calendarjanitor
}
