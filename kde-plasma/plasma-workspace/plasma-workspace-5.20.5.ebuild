# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
KDE_TEST="forceoptional"
FRAMEWORKS_MINIMAL=5.74.0
QT_MINIMAL=5.15.1
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="KDE Plasma workspace"

LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS="*"
IUSE="appstream +calendar +fontconfig geolocation gps qalculate screencast +semantic-desktop systemd telemetry"

REQUIRED_USE="gps? ( geolocation )"

BDEPEND="virtual/pkgconfig"
COMMON_DEPEND="
	>=dev-libs/wayland-1.15
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtdeclarative widgets)
	$(add_qt_dep qtgui jpeg)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtsql)
	$(add_qt_dep qtsvg)
	$(add_qt_dep qtwayland)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtx11extras)
	$(add_qt_dep qtxml)
	$(add_frameworks_dep kactivities)
	$(add_frameworks_dep kactivities-stats)
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
	$(add_frameworks_dep kdelibs4support)
	$(add_frameworks_dep kglobalaccel)
	$(add_frameworks_dep kguiaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kidletime)
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
	$(add_plasma_dep libkscreen)
	$(add_plasma_dep libksysguard)
	$(add_plasma_dep libkworkspace)
	>=media-libs/phonon-4.11.0
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
		media-libs/fontconfig
		media-libs/freetype
		x11-libs/libXft
		x11-libs/xcb-util-image
	)
	geolocation? ( $(add_frameworks_dep networkmanager-qt) )
	gps? ( sci-geosciences/gpsd )
	qalculate? ( sci-libs/libqalculate:= )
	screencast? (
		>=media-video/pipewire-0.3:=
		x11-libs/libdrm
	)
	semantic-desktop? ( $(add_frameworks_dep baloo) )
	telemetry? ( dev-libs/kuserfeedback:5 )
"
DEPEND="${COMMON_DEPEND}
	>=dev-libs/plasma-wayland-protocols-1.1.1
	$(add_qt_dep qtconcurrent)
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
	$(add_kdeapps_dep kio-extras)
	$(add_frameworks_dep kdesu)
	$(add_frameworks_dep kirigami)
	$(add_frameworks_dep kquickcharts)
	$(add_plasma_dep ksysguard)
	$(add_plasma_dep milou)
	$(add_plasma_dep plasma-integration)
	x11-apps/xmessage
	x11-apps/xprop
	x11-apps/xrdb
	x11-apps/xsetroot
	systemd? ( sys-apps/dbus[user-session] )
	!systemd? ( sys-apps/dbus )
	!<kde-plasma/plasma-desktop-5.19.80:5
"
PDEPEND="
	$(add_plasma_dep kde-cli-tools)
"

PATCHES=(
	"${FILESDIR}/${PN}-5.14.2-split-libkworkspace.patch"
	"${FILESDIR}/${P}-avoid-render-invisible-contents.patch" # KDE-Bug 347772
	"${FILESDIR}/${P}-fix-crash-on-screen-changes.patch" # KDE-Bug 425711
)

RESTRICT+=" test"

src_prepare() {
	kde5_src_prepare

	cmake_comment_add_subdirectory libkworkspace
	# delete colliding libkworkspace translations
	find po -type f -name "*po" -and -name "libkworkspace*" -delete || die

	# TODO: try to get a build switch upstreamed
	if ! use screencast; then
		sed -e "s/^pkg_check_modules.*PipeWire/#&/" \
			-i CMakeLists.txt || die
	fi
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_xembed-sni-proxy=OFF
		$(cmake-utils_use_find_package appstream AppStreamQt)
		$(cmake-utils_use_find_package calendar KF5Holidays)
		$(cmake-utils_use_find_package fontconfig Fontconfig)
		$(cmake-utils_use_find_package geolocation KF5NetworkManagerQt)
		$(cmake-utils_use_find_package qalculate Qalculate)
		$(cmake-utils_use_find_package semantic-desktop KF5Baloo)
		$(cmake-utils_use_find_package telemetry KUserFeedback)
	)

	use geolocation && mycmakeargs+=( $(cmake-utils_use_find_package gps libgps) )

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

	# Clean up pre-5.17.4 dirs
	rmdir -v "${EROOT}"/etc/plasma{/startup,/shutdown,} 2> /dev/null

	elog "To enable gpg-agent and/or ssh-agent in Plasma sessions,"
	elog "edit ${EPREFIX}/etc/xdg/plasma-workspace/env/10-agent-startup.sh"
	elog "and ${EPREFIX}/etc/xdg/plasma-workspace/shutdown/10-agent-shutdown.sh"
}
