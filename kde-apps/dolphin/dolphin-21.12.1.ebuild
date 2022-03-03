# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
KDE_TEST="true"
FRAMEWORKS_MINIMAL=5.75.0
QT_MINIMAL=5.15.2
VIRTUALX_REQUIRED="test"
inherit eutils kde5

DESCRIPTION="Plasma filemanager focusing on usability"
HOMEPAGE="https://apps.kde.org/en/dolphin https://userbase.kde.org/Dolphin"
LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS="*"
IUSE="activities semantic-desktop telemetry"

DEPEND="
	$(add_qt_dep qtconcurrent)
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtxml)
	$(add_frameworks_dep kbookmarks)
	$(add_frameworks_dep kcmutils)
	$(add_frameworks_dep kcodecs)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kcrash)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kinit)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kitemviews)
	$(add_frameworks_dep kjobwidgets)
	$(add_frameworks_dep knewstuff)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep kparts)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep ktextwidgets)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kwindowsystem)
	$(add_frameworks_dep kxmlgui)
	$(add_frameworks_dep solid)
	>=media-libs/phonon-4.11.0
	activities? ( $(add_frameworks_dep kactivities) )
	semantic-desktop? (
		$(add_kdeapps_dep baloo-widgets)
		$(add_frameworks_dep baloo)
		$(add_frameworks_dep kfilemetadata)
	)
	telemetry? ( dev-libs/kuserfeedback:5 )
"
RDEPEND="${DEPEND}
	$(add_kdeapps_dep kio-extras)
"

src_configure() {
	local mycmakeargs=(
		-DCMAKE_DISABLE_FIND_PACKAGE_PackageKitQt5=ON
		$(cmake-utils_use_find_package activities KF5Activities)
		$(cmake-utils_use_find_package semantic-desktop KF5Baloo)
		$(cmake-utils_use_find_package semantic-desktop KF5BalooWidgets)
		$(cmake-utils_use_find_package semantic-desktop KF5FileMetaData)
		$(cmake-utils_use_find_package telemetry KUserFeedback)
	)
	kde5_src_configure
}

src_test() {
	local myctestargs=(
		# servicemenuinstaller requires ruby, no thanks
		# dolphinmainwindowtest, kitemlistcontrollertest, kfileitemlistviewtest, kfileitemmodeltest hang forever
		# placesitemmodeltest requires DBus
		-E "(servicemenuinstaller|dolphinmainwindowtest|kfileitemlistviewtest|kfileitemmodeltest|kitemlistcontrollertest|placesitemmodeltest)"
	)
	kde5_src_test
}

pkg_postinst() {
	if [[ -z "${REPLACING_VERSIONS}" ]]; then
		elog "Optional dependencies:"
		optfeature "compress/extract and other actions" kde-apps/ark:${SLOT}
		optfeature "crypto actions" kde-apps/kleopatra:${SLOT}
		optfeature "video file thumbnails" kde-apps/ffmpegthumbs:${SLOT}
		optfeature "graphics file thumbnails" kde-apps/thumbnailers:${SLOT}
		optfeature "'Share' context menu actions" kde-frameworks/purpose:${SLOT}
	fi
	kde5_pkg_postinst
}