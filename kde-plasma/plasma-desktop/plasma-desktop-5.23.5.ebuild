# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
KDE_TEST="true"
FRAMEWORKS_MINIMAL=5.86.0
QT_MINIMAL=5.15.2
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="KDE Plasma desktop"
XORGHDRS="${PN}-override-include-dirs-1"
SRC_URI+=" https://dev.gentoo.org/~asturm/distfiles/${XORGHDRS}.tar.xz"

LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS="*"
IUSE="emoji ibus +kaccounts +policykit scim +semantic-desktop"

BDEPEND="virtual/pkgconfig"
COMMON_DEPEND="
	$(add_qt_dep qtconcurrent)
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtprintsupport)
	$(add_qt_dep qtsql)
	$(add_qt_dep qtsvg)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtx11extras)
	$(add_qt_dep qtxml)
	$(add_frameworks_dep attica)
	$(add_frameworks_dep kactivities)
	$(add_frameworks_dep kactivities-stats)
	$(add_frameworks_dep karchive)
	$(add_frameworks_dep kauth)
	$(add_frameworks_dep kbookmarks)
	$(add_frameworks_dep kcmutils)
	$(add_frameworks_dep kcodecs)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kcrash)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep kdeclarative)
	$(add_frameworks_dep kded)
	$(add_frameworks_dep kdelibs4support)
	$(add_frameworks_dep kglobalaccel)
	$(add_frameworks_dep kguiaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kitemmodels)
	$(add_frameworks_dep kitemviews)
	$(add_frameworks_dep kjobwidgets)
	$(add_frameworks_dep knewstuff)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep knotifyconfig)
	$(add_frameworks_dep kparts)
	$(add_frameworks_dep krunner)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kwindowsystem)
	$(add_frameworks_dep kxmlgui)
	$(add_frameworks_dep plasma)
	$(add_frameworks_dep solid)
	$(add_frameworks_dep sonnet)
	$(add_plasma_dep kwin)
	$(add_plasma_dep libksysguard)
	$(add_plasma_dep libkworkspace)
	$(add_plasma_dep plasma-workspace)
	>=media-libs/phonon-4.11.0
	x11-libs/libX11
	x11-libs/libXfixes
	x11-libs/libXi
	x11-libs/libxcb[xkb]
	x11-libs/libxkbfile
	emoji? (
		app-i18n/ibus[emoji]
		dev-libs/glib:2
		media-fonts/noto-emoji
	)
	ibus? (
		app-i18n/ibus
		dev-libs/glib:2
		$(add_qt_dep qtx11extras)
		x11-libs/libxcb
		x11-libs/xcb-util-keysyms
	)
	kaccounts? (
		$(add_kdeapps_dep kaccounts-integration)
		net-libs/accounts-qt
	)
	scim? ( app-i18n/scim )
	semantic-desktop? ( $(add_frameworks_dep baloo) )
"
DEPEND="${COMMON_DEPEND}
	dev-libs/boost
	x11-base/xorg-proto
"
RDEPEND="${COMMON_DEPEND}
	!<kde-plasma/kdeplasma-addons-5.15.80
	!kde-plasma/user-manager
	$(add_qt_dep qtgraphicaleffects)
	$(add_qt_dep qtquickcontrols2)
	$(add_frameworks_dep kirigami)
	$(add_frameworks_dep qqc2-desktop-style)
	$(add_plasma_dep kde-cli-tools)
	$(add_plasma_dep oxygen)
	sys-apps/util-linux
	x11-apps/setxkbmap
	kaccounts? ( net-libs/signon-oauth2 )
	policykit? ( sys-apps/accountsservice )
"
BDEPEND="virtual/pkgconfig"

PATCHES=(
	"${WORKDIR}/${XORGHDRS}/override-include-dirs.patch" # downstream patch
)

src_prepare() {
	kde5_src_prepare

	use policykit || cmake_run_in kcms cmake_comment_add_subdirectory users

	if ! use ibus; then
		sed -e "s/Qt5X11Extras_FOUND AND XCB_XCB_FOUND AND XCB_KEYSYMS_FOUND/false/" \
			-i applets/kimpanel/backend/ibus/CMakeLists.txt || die
	fi
}

src_configure() {
	local mycmakeargs=(
		-DEvdev_INCLUDE_DIRS="${WORKDIR}/${XORGHDRS}"/include
		-DXORGLIBINPUT_INCLUDE_DIRS="${WORKDIR}/${XORGHDRS}"/include
		-DXORGSERVER_INCLUDE_DIRS="${WORKDIR}/${XORGHDRS}"/include
		-DSynaptics_INCLUDE_DIRS="${WORKDIR}/${XORGHDRS}"/include
		$(cmake-utils_use_find_package kaccounts AccountsQt5)
		$(cmake-utils_use_find_package kaccounts KAccounts)
		$(cmake-utils_use_find_package scim SCIM)
		$(cmake-utils_use_find_package semantic-desktop KF5Baloo)
	)
	if ! use emoji && ! use ibus; then
		mycmakeargs+=( -DCMAKE_DISABLE_FIND_PACKAGE_IBus=ON )
	fi

	kde5_src_configure
}

src_test() {
	# parallel tests fail, foldermodeltest,positionertest hang, bug #646890
	# test_kio_fonts needs D-Bus, bug #634166
	# lookandfeel-kcmTest is unreliable for a long time, bug #607918
	local myctestargs=(
		-j1
		-E "(foldermodeltest|positionertest|test_kio_fonts|lookandfeel-kcmTest)"
	)

	kde5_src_test
}
