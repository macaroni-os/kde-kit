# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="Application to manage alarms and other timer based alerts for the desktop"
HOMEPAGE="https://apps.kde.org/en/kalarm https://userbase.kde.org/KAlarm"
LICENSE="GPL-2+ handbook? ( FDL-1.2+ )"
SLOT="5"
KEYWORDS="*"
IUSE="X"

BDEPEND="
	dev-libs/libxslt
"
DEPEND="
	dev-libs/ktextaddons
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtwidgets)
	$(add_kdeapps_dep akonadi)
	$(add_kdeapps_dep akonadi-contacts)
	$(add_kdeapps_dep akonadi-mime)
	$(add_kdeapps_dep grantleetheme)
	$(add_kdeapps_dep kcalutils)
	$(add_kdeapps_dep kidentitymanagement)
	$(add_kdeapps_dep kmailtransport)
	$(add_kdeapps_dep kmime)
	$(add_kdeapps_dep kontactinterface)
	$(add_kdeapps_dep kpimtextedit)
	$(add_kdeapps_dep mailcommon)
	$(add_kdeapps_dep pimcommon)
	$(add_frameworks_dep kauth)
	$(add_frameworks_dep kcalendarcore)
	$(add_frameworks_dep kcmutils)
	$(add_frameworks_dep kcodecs)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcontacts)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kcrash)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep kglobalaccel)
	$(add_frameworks_dep kguiaddons)
	$(add_frameworks_dep kholidays)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kidletime)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kitemmodels)
	$(add_frameworks_dep kjobwidgets)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep knotifyconfig)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep ktextwidgets)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kwindowsystem)
	$(add_frameworks_dep kxmlgui)
	>=media-libs/phonon-4.11.0
	X? (
		$(add_qt_dep qtx11extras)
		x11-libs/libX11
	)
"
RDEPEND="${DEPEND}
	$(add_kdeapps_dep kdepim-runtime)
"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package X Qt5X11Extras)
		$(cmake-utils_use_find_package X X11)
	)

	kde5_src_configure
}
