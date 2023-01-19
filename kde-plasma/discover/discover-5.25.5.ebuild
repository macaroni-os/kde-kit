# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="forceoptional"
FRAMEWORKS_MINIMAL=5.94.0
QT_MINIMAL=5.15.2
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="KDE Plasma resources management GUI"
HOMEPAGE="https://userbase.kde.org/Discover"
LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS="*"
IUSE="+firmware flatpak telemetry"

# libmarkdown (app-text/discount) only used in PackageKitBackend
DEPEND="
	$(add_qt_dep qtconcurrent)
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtxml)
	$(add_frameworks_dep attica)
	$(add_frameworks_dep kcmutils)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kcrash)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep kdeclarative)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kidletime)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kirigami)
	$(add_frameworks_dep knewstuff)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kxmlgui)
	firmware? ( sys-apps/fwupd )
	flatpak? (
		>=dev-libs/appstream-0.14.4
		sys-apps/flatpak
	)
	telemetry? ( dev-libs/kuserfeedback:5 )
"
RDEPEND="${DEPEND}
	$(add_qt_dep qtquickcontrols2)
	$(add_frameworks_dep kirigami)
"

src_prepare() {
	kde5_src_prepare
	# we don't need it with PackageKitBackend off
	punt_bogus_dep KF5 Archive
}

src_configure() {
	local mycmakeargs=(
		-DCMAKE_DISABLE_FIND_PACKAGE_packagekitqt5=ON
		-DCMAKE_DISABLE_FIND_PACKAGE_Snapd=ON
		-DWITH_KCM=OFF
		-DBUILD_FlatpakBackend=$(usex flatpak)
		$(cmake-utils_use_find_package flatpak AppStreamQt)
		-DBUILD_FwupdBackend=$(usex firmware)
		$(cmake-utils_use_find_package telemetry KUserFeedback)
	)

	kde5_src_configure
}

src_test() {
	# bug 686392: needs network connection
	local myctestargs=(
		-E "(knsbackendtest)"
	)

	kde5_src_test
}
