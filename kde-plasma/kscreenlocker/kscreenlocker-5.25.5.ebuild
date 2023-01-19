# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="forceoptional"
FRAMEWORKS_MINIMAL=5.82.0
QT_MINIMAL=5.15.2
VIRTUALX_REQUIRED="test"
inherit kde5 pam

DESCRIPTION="Library and components for secure lock screen architecture"
LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS="*"
IUSE="+pam"

COMMON_DEPEND="
	dev-libs/wayland
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtx11extras)
	$(add_frameworks_dep kcmutils)
	$(add_frameworks_dep kconfig qml)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kcrash)
	$(add_frameworks_dep kdeclarative)
	$(add_frameworks_dep kglobalaccel)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kidletime)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep kpackage)
	$(add_frameworks_dep kwayland)
	$(add_frameworks_dep kwindowsystem)
	$(add_frameworks_dep kxmlgui)
	$(add_frameworks_dep solid)
	x11-libs/libX11
	x11-libs/libXi
	x11-libs/libxcb
	x11-libs/xcb-util-keysyms
	pam? ( sys-libs/pam )
"
DEPEND="${COMMON_DEPEND}
	x11-base/xorg-proto
"
RDEPEND="${COMMON_DEPEND}
	$(add_qt_dep qtquickcontrols2)
	$(add_frameworks_dep kirigami)
	$(add_frameworks_dep plasma)
"
PDEPEND="
	$(add_plasma_dep kde-cli-tools)
	$(add_plasma_dep layer-shell-qt)
"
BDEPEND="dev-util/wayland-scanner"

RESTRICT+=" test"

src_prepare() {
	kde5_src_prepare
	use test || cd greeter && cmake_comment_add_subdirectory autotests
}

src_configure() {
	local mycmakeargs=(
		-DPAM_REQUIRED=$(usex pam)
		$(cmake-utils_use_find_package pam PAM)
	)
	kde5_src_configure
}

src_test() {
	# requires running environment
	local myctestargs=(
		-E x11LockerTest
	)
	kde5_src_test
}

src_install() {
	kde5_src_install

	if use pam; then
		newpamd "${FILESDIR}/kde.pam" kde
		newpamd "${FILESDIR}/kde-np.pam" kde-np
	else
		chown root "${ED}"/usr/$(get_libdir)/libexec/kcheckpass || die
		chmod +s "${ED}"/usr/$(get_libdir)/libexec/kcheckpass || die
	fi
}
