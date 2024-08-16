# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
KDE_TEST="forceoptional"
FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.15.1
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Organizational assistant, providing calendars and other similar functionality"
HOMEPAGE="https://apps.kde.org/en/korganizer"
LICENSE="GPL-2+ handbook? ( FDL-1.2+ )"
SLOT="5"
KEYWORDS="*"
IUSE="telemetry X"

BDEPEND="
	test? ( $(add_kdeapps_dep akonadi tools) )
"
COMMON_DEPEND="
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_kdeapps_dep akonadi)
	$(add_kdeapps_dep akonadi-calendar)
	$(add_kdeapps_dep akonadi-contacts)
	$(add_kdeapps_dep akonadi-mime)
	$(add_kdeapps_dep akonadi-notes)
	$(add_kdeapps_dep akonadi-search)
	$(add_kdeapps_dep calendarsupport)
	$(add_kdeapps_dep eventviews)
	$(add_kdeapps_dep grantleetheme)
	$(add_kdeapps_dep incidenceeditor)
	$(add_kdeapps_dep kcalutils)
	$(add_kdeapps_dep kidentitymanagement)
	$(add_kdeapps_dep kmailtransport)
	$(add_kdeapps_dep kmime)
	$(add_kdeapps_dep kontactinterface)
	$(add_kdeapps_dep kpimtextedit)
	$(add_kdeapps_dep libkdepim)
	$(add_kdeapps_dep pimcommon)
	$(add_frameworks_dep kcalendarcore)
	$(add_frameworks_dep kcmutils)
	$(add_frameworks_dep kcodecs)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcontacts)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kcrash)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep kholidays)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kitemmodels)
	$(add_frameworks_dep kitemviews)
	$(add_frameworks_dep kjobwidgets)
	$(add_frameworks_dep knewstuff)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep kparts)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kwindowsystem)
	$(add_frameworks_dep kxmlgui)
	>=media-libs/phonon-4.11.0
	telemetry? ( dev-libs/kuserfeedback:5 )
	X? (
		$(add_qt_dep qtx11extras)
		x11-libs/libX11
	)
"
DEPEND="${COMMON_DEPEND}
	$(add_qt_dep designer)
	$(add_kdeapps_dep kldap)
	test? ( $(add_kdeapps_dep akonadi sqlite) )
"
RDEPEND="${COMMON_DEPEND}
	$(add_kdeapps_dep kdepim-runtime)
"

# testkodaymatrix is broken, akonadi* tests need DBus, bug #665686
RESTRICT+=" test"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package telemetry KUserFeedback)
		$(cmake-utils_use_find_package X X11)
	)

	kde5_src_configure
}