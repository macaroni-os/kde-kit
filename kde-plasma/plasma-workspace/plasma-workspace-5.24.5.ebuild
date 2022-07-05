# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
KDE_TEST="forceoptional"
FRAMEWORKS_MINIMAL=5.94.0
QT_MINIMAL=5.15.2
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="KDE Plasma workspace"
LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS="*"
IUSE="appstream +calendar +fontconfig geolocation gps screencast +semantic-desktop telemetry"

REQUIRED_USE="gps? ( geolocation )"
RESTRICT="test"

# slot op: various private QtWaylandClient headers
COMMON_DEPEND="
	>=dev-libs/wayland-1.15
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtdeclarative widgets)
	$(add_qt_dep qtgui jpeg,libinput)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtsql)
	$(add_qt_dep qtsvg)
	$(add_qt_dep qtwayland)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtx11extras)
	$(add_qt_dep qtxml)
	$(add_frameworks_dep kactivities)
	$(add_frameworks_dep kactivities-stats)
	$(add_frameworks_dep karchive)
	$(add_frameworks_dep kauth)
	$(add_frameworks_dep kbookmarks)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kcrash)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep kdeclarative)
	$(add_frameworks_dep kded)
	$(add_frameworks_dep kglobalaccel)
	$(add_frameworks_dep kguiaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kidletime)
	$(add_frameworks_dep kinit)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kitemmodels)
	$(add_frameworks_dep kitemviews)
	$(add_frameworks_dep kjobwidgets)
	$(add_frameworks_dep knewstuff)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep knotifyconfig)
	$(add_frameworks_dep kpackage)
	$(add_frameworks_dep kpeople)
	$(add_frameworks_dep krunner)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep ktexteditor)
	$(add_frameworks_dep ktextwidgets)
	$(add_frameworks_dep kunitconversion)
	$(add_frameworks_dep kwallet)
	$(add_frameworks_dep kwayland)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kwindowsystem)
	$(add_frameworks_dep kxmlgui)
	$(add_frameworks_dep plasma)
	$(add_frameworks_dep prison qml)
	$(add_frameworks_dep solid)
	$(add_plasma_dep breeze)
	$(add_plasma_dep kscreenlocker)
	$(add_plasma_dep kwin)
	$(add_plasma_dep layer-shell-qt)
	$(add_plasma_dep libkscreen)
	$(add_plasma_dep libksysguard)
	$(add_plasma_dep libkworkspace)
	>=media-libs/phonon-4.11.0
	sci-libs/libqalculate:=
	sys-libs/zlib
	x11-libs/libICE
	x11-libs/libSM
	x11-libs/libX11
	x11-libs/libXau
	x11-libs/libxcb
	x11-libs/libXcursor
	x11-libs/libXfixes
	x11-libs/libXrender
	x11-libs/libXtst
	x11-libs/xcb-util
	x11-libs/xcb-util-image
	appstream? ( dev-libs/appstream[qt5] )
	calendar? ( $(add_frameworks_dep kholidays) )
	fontconfig? (
		$(add_qt_dep qtprintsupport)
		media-libs/fontconfig
		x11-libs/libXft
		x11-libs/xcb-util-image
	)
	geolocation? ( $(add_frameworks_dep networkmanager-qt) )
	gps? ( sci-geosciences/gpsd )
	screencast? (
		$(add_qt_dep qtgui egl)
		media-libs/libglvnd
		>=media-video/pipewire-0.3:=
		x11-libs/libdrm
	)
	semantic-desktop? ( $(add_frameworks_dep baloo) )
	telemetry? ( dev-libs/kuserfeedback:5 )
"
DEPEND="${COMMON_DEPEND}
	>=dev-libs/plasma-wayland-protocols-1.6.0
	$(add_qt_dep qtconcurrent)
	>=dev-util/wayland-scanner-1.19.0
	x11-base/xorg-proto
	fontconfig? ( x11-libs/libXrender )
"
RDEPEND="${COMMON_DEPEND}
	app-text/iso-codes
	$(add_qt_dep qdbus)
	$(add_qt_dep qtgraphicaleffects)
	$(add_qt_dep qtpaths)
	$(add_qt_dep qtquickcontrols widgets)
	$(add_qt_dep qtquickcontrols2)
	kde-apps/kio-extras:5
	$(add_frameworks_dep kirigami)
	$(add_frameworks_dep kquickcharts)
	$(add_plasma_dep milou)
	$(add_plasma_dep plasma-integration)
	sys-apps/dbus
	x11-apps/xmessage
	x11-apps/xprop
	x11-apps/xrdb
	x11-apps/xsetroot
	!<kde-plasma/breeze-5.22.90:5
	!<kde-plasma/plasma-desktop-5.23.90:5
"
BDEPEND="
	virtual/pkgconfig
"
PDEPEND="$(add_plasma_dep kde-cli-tools)"

PATCHES=(
	"${FILESDIR}"/${PN}-5.21.5-split-libkworkspace.patch # downstream
	"${FILESDIR}"/${PN}-5.22.5-krunner-cwd-at-home.patch # TODO upstream: KDE-bug 432975, bug 767478
	"${FILESDIR}"/${P}-sddm-theme-KeyboardButton-fix-layout-name.patch
	"${FILESDIR}"/${P}-applets-appmenu-fix-top-level-menu-text-coloration.patch # KDE-bug 453348
	"${FILESDIR}"/${P}-applets-systemtray-prefer-IconName-over-IconPixmap.patch # KDE-bug 418996
	"${FILESDIR}"/${P}-wallpapers-image-fix-missing-folder-action-buttons.patch
	"${FILESDIR}"/${P}-fix-plasmashell-crash-on-panel-w-systray-remove.patch # KDE-bug 453726
	"${FILESDIR}"/${P}-kcms-desktoptheme-detect-installed-styles-{1,2}.patch # KDE-bug 453830
	"${FILESDIR}"/${P}-applets-kicker-refresh-RootModel-on-session-backend.patch # KDE-bug 427530
)

src_prepare() {
	kde5_src_prepare

	cmake_comment_add_subdirectory libkworkspace
	# delete colliding libkworkspace translations
	if [[ ${KDE_BUILD_TYPE} = release ]]; then
		find po -type f -name "*po" -and -name "libkworkspace*" -delete || die
	fi

	# TODO: try to get a build switch upstreamed
	if ! use screencast; then
		sed -e "s/^pkg_check_modules.*PipeWire/#&/" -i CMakeLists.txt || die
	fi

	# TODO: try to get a build switch upstreamed
	if use geolocation; then
		use gps || sed -e "s/^pkg_check_modules.*LIBGPS/#&/" \
			-i dataengines/geolocation/CMakeLists.txt || die
	fi

	kde5_punt_kf_module Su
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_xembed-sni-proxy=OFF
		-DCMAKE_DISABLE_FIND_PACKAGE_PackageKitQt5=ON
		$(cmake_use_find_package appstream AppStreamQt)
		$(cmake_use_find_package calendar KF5Holidays)
		$(cmake_use_find_package fontconfig Fontconfig)
		$(cmake_use_find_package geolocation KF5NetworkManagerQt)
		$(cmake_use_find_package semantic-desktop KF5Baloo)
		$(cmake_use_find_package telemetry KUserFeedback)
	)

	kde5_src_configure
}

src_install() {
	kde5_src_install

	# default startup and shutdown scripts
	insinto /etc/xdg/plasma-workspace/env
	doins "${FILESDIR}"/10-agent-startup.sh

	insinto /etc/xdg/plasma-workspace/shutdown
	doins "${FILESDIR}"/10-agent-shutdown.sh
	fperms +x /etc/xdg/plasma-workspace/shutdown/10-agent-shutdown.sh
}

pkg_postinst () {
	kde5_pkg_postinst

	elog "To enable gpg-agent and/or ssh-agent in Plasma sessions,"
	elog "edit ${EPREFIX}/etc/xdg/plasma-workspace/env/10-agent-startup.sh"
	elog "and ${EPREFIX}/etc/xdg/plasma-workspace/shutdown/10-agent-shutdown.sh"
}
