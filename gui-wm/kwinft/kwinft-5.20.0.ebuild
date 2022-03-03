# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="optional"
KDE_TEST="optional"
QT_MINIMAL=5.15.1
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Wayland compositor and X11 window manager forked from KWin"
HOMEPAGE="https://gitlab.com/kwinft/kwinft"
SRC_URI="https://gitlab.com/${PN}/${PN}/-/archive/${P/-/@}/${PN}-${P/-/@}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="5"
KEYWORDS="*"
IUSE="caps gles2-only multimedia tools"

COMMON_DEPEND="
	>=dev-libs/libinput-1.14
	>=dev-libs/wayland-1.2
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui gles2-only=)
	$(add_qt_dep qtscript)
	$(add_qt_dep qtsensors)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtx11extras)
	gui-libs/wrapland:5
	$(add_frameworks_dep kactivities)
	$(add_frameworks_dep kauth)
	$(add_frameworks_dep kcmutils)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kcrash)
	$(add_frameworks_dep kdeclarative)
	$(add_frameworks_dep kglobalaccel)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kidletime)
	$(add_frameworks_dep kio)
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
	media-libs/libepoxy
	media-libs/mesa[egl,gbm,wayland,X(+)]
	virtual/libudev:=
	x11-libs/libICE
	x11-libs/libSM
	x11-libs/libX11
	x11-libs/libXi
	x11-libs/libdrm
	>=x11-libs/libxcb-1.10
	>=x11-libs/libxkbcommon-0.7.0
	x11-libs/xcb-util-cursor
	x11-libs/xcb-util-image
	x11-libs/xcb-util-keysyms
	x11-libs/xcb-util-wm
	caps? ( sys-libs/libcap )
	gles2-only? ( media-libs/mesa[gles2] )
"
RDEPEND="${COMMON_DEPEND}
	!kde-plasma/kwin:5
	$(add_qt_dep qtquickcontrols)
	$(add_qt_dep qtquickcontrols2)
	$(add_qt_dep qtvirtualkeyboard)
	$(add_frameworks_dep kirigami)
	multimedia? ( $(add_qt_dep qtmultimedia gstreamer,qml) )
"
DEPEND="${COMMON_DEPEND}
	$(add_qt_dep designer)
	$(add_qt_dep qtconcurrent)
	x11-base/xorg-proto
"
PDEPEND="
	$(add_plasma_dep kde-cli-tools)
"

RESTRICT+=" test"

S="${WORKDIR}/${PN}-${P/-/@}"

src_prepare() {
	kde5_src_prepare
	use multimedia || eapply "${FILESDIR}/kwin-5.16.80-gstreamer-optional.patch"
}

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package caps Libcap)
		-DKWIN_BUILD_PERF=$(usex tools)
	)

	kde5_src_configure
}
