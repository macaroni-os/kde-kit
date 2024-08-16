# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
FRAMEWORKS_MINIMAL=5.111.0
QT_MINIMAL=5.15.2
inherit kde5

DESCRIPTION="VNC-compatible server to share Plasma desktops"
HOMEPAGE="https://apps.kde.org/en/krfb"
LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS="*"
IUSE="screencast wayland"
REQUIRED_USE="screencast? ( wayland )"

DEPEND="
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtx11extras)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kcrash)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep kdnssd)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep kwallet)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kwindowsystem)
	$(add_frameworks_dep kxmlgui)
	>=net-libs/libvncserver-0.9.9
	x11-libs/libX11
	x11-libs/libxcb
	x11-libs/libXtst
	x11-libs/xcb-util-image
	screencast? ( >=media-video/pipewire-0.3:= )
	wayland? (
		dev-libs/wayland
		|| (
			$(add_qt_dep qtgui libinput)
			$(add_qt_dep qtgui X)
		)
		$(add_qt_dep qtwayland)
		$(add_frameworks_dep kwayland)
		$(add_plasma_dep kpipewire)
		media-libs/libepoxy
		media-libs/mesa[gbm(+)]
		media-video/pipewire:=
		>=dev-libs/plasma-wayland-protocols-1.5.0
		media-libs/libglvnd
	)
"
RDEPEND="${DEPEND}
	wayland? ( sys-apps/xdg-desktop-portal[screencast] )
"

src_prepare() {
	kde5_src_prepare

	# TODO: try to get a build switch upstreamed
	if ! use screencast; then
		sed -e "s/^.*pkg_check_modules.*PipeWire/#&/" \
			-i CMakeLists.txt || die
	fi
}

src_configure() {
	local mycmakeargs=(
		-DDISABLE_PIPEWIRE=$(usex !wayland)
		$(cmake-utils_use_find_package wayland PipeWire)
		$(cmake_use_find_package wayland PlasmaWaylandProtocols)
		$(cmake_use_find_package wayland gbm)
		$(cmake_use_find_package wayland EGL)
		$(cmake_use_find_package wayland epoxy)
	)

	kde5_src_configure
}
