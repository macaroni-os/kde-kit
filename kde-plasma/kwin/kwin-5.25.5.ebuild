# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="optional"
KDE_TEST="optional"
FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.15.2
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Flexible, composited Window Manager for windowing systems on Linux"
LICENSE="GPL-2+"
SLOT="5"
KEYWORDS="*"
IUSE="accessibility caps gles2-only multimedia screencast"

COMMON_DEPEND="
	>=dev-libs/libinput-1.19
	>=dev-libs/wayland-1.20.0
	$(add_qt_dep qtconcurrent)
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui egl,gles2-only,libinput)
	$(add_qt_dep qtwayland)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtx11extras)
	$(add_frameworks_dep kactivities)
	$(add_frameworks_dep kauth)
	$(add_frameworks_dep kcmutils)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig qml)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kcrash)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep kdeclarative)
	$(add_frameworks_dep kglobalaccel)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kidletime)
	$(add_frameworks_dep kitemviews)
	$(add_frameworks_dep knewstuff)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep kpackage)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep ktextwidgets)
	$(add_frameworks_dep kwayland)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kwindowsystem X)
	$(add_frameworks_dep kxmlgui)
	$(add_frameworks_dep plasma)
	$(add_plasma_dep breeze)
	$(add_plasma_dep kdecoration)
	$(add_plasma_dep kscreenlocker)
	media-libs/fontconfig
	media-libs/freetype
	media-libs/lcms
	media-libs/libepoxy
	media-libs/libglvnd
	media-libs/mesa[egl,gbm,wayland,X(+)]
	virtual/libudev:=
	x11-libs/libX11
	x11-libs/libXi
	x11-libs/libdrm
	>=x11-libs/libxcb-1.10
	>=x11-libs/libxcvt-0.1.1
	>=x11-libs/libxkbcommon-0.7.0
	x11-libs/xcb-util-cursor
	x11-libs/xcb-util-image
	x11-libs/xcb-util-keysyms
	x11-libs/xcb-util-wm
	accessibility? ( media-libs/libqaccessibilityclient:5 )
	caps? ( sys-libs/libcap )
	gles2-only? ( media-libs/mesa[gles2] )
	screencast? ( >=media-video/pipewire-0.3:= )
"
# TODO: sys-apps/hwdata? not packaged yet; commit 33a1777a, Gentoo-bug 717216
RDEPEND="${COMMON_DEPEND}
	!kde-plasma/kwayland-server
	$(add_qt_dep qtquickcontrols)
	$(add_qt_dep qtquickcontrols2)
	$(add_qt_dep qtvirtualkeyboard)
	$(add_frameworks_dep kirigami)
	$(add_frameworks_dep kitemmodels qml)
	multimedia? ( $(add_qt_dep qtmultimedia gstreamer,qml) )
"
DEPEND="${COMMON_DEPENDi}
	dev-libs/plasma-wayland-protocols
	>=dev-libs/wayland-protocols-1.25
	$(add_qt_dep designer)
	$(add_qt_dep qtconcurrent)
	x11-base/xorg-proto
"
BDEPEND="
	dev-util/wayland-scanner
"
PDEPEND="
	$(add_plasma_dep kde-cli-tools)
"

RESTRICT+=" test"

src_prepare() {
	kde5_src_prepare
	use multimedia || eapply "${FILESDIR}/${PN}-5.21.80-gstreamer-optional.patch"

	# TODO: try to get a build switch upstreamed
	if ! use screencast; then
		sed -e "s/^pkg_check_modules.*PipeWire/#&/" \
			-i CMakeLists.txt || die
	fi
}

src_configure() {
	addpredict /dev
	local mycmakeargs=(
		$(cmake-utils_use_find_package accessibility QAccessibilityClient)
		$(cmake-utils_use_find_package caps Libcap)
	)

	kde5_src_configure
}
