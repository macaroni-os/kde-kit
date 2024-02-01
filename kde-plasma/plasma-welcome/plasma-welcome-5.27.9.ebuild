# Distributed under the terms of the GNU General Public License v2

EAPI=7

KFMIN=5.106.0
QTMIN=5.15.2
inherit kde5

DESCRIPTION="A friendly onboarding wizard for Plasma"

LICENSE="GPL-2+"
SLOT="5"
KEYWORDS="*"
IUSE="discover +kaccounts telemetry"

DEPEND="
	$(add_qt_dep qtdeclarative widgets)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtquickcontrols2)
	$(add_qt_dep qtsvg)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kirigami)
	$(add_frameworks_dep knewstuff)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep kwindowsystem)
	$(add_frameworks_dep plasma)
	kaccounts? ( kde-apps/kaccounts-integration:5 )
	telemetry? ( dev-libs/kuserfeedback:5 )
"
RDEPEND="${DEPEND}
	discover? ( kde-plasma/discover:5 )
"

PATCHES=( "${FILESDIR}/${PN}-5.27.4.1-kaccounts-optional.patch" )

src_prepare() {
	kde5_src_prepare

	if ! use discover; then
		sed -e "s:pageStack.push(discover);:// & disabled by IUSE=discover:" \
			-i src/contents/ui/main.qml || die
	fi
}

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package kaccounts KAccounts)
		$(cmake-utils_use_find_package telemetry KUserFeedback)
	)
	kde5_src_configure
}

