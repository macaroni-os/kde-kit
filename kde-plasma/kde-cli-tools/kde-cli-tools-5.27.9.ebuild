# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
KDE_TEST="optional"
FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.15.2
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Tools based on KDE Frameworks 5 to better interact with the system"
HOMEPAGE="https://invent.kde.org/plasma/kde-cli-tools"
LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS="*"
IUSE="kdesu X"

REQUIRED_USE="kdesu? ( X )"

DEPEND="
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtsvg)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kactivities)
	$(add_frameworks_dep kcmutils)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdeclarative)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kparts)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kwindowsystem)
	$(add_plasma_dep libkworkspace)
	kdesu? ( $(add_frameworks_dep kdesu) )
	X? (
		$(add_qt_dep qtx11extras)
		x11-libs/libX11
	)
"
RDEPEND="${DEPEND}
	kdesu? ( sys-apps/dbus[X] )
"

PATCHES=( "${FILESDIR}/${PN}-5.12.80-tests-optional.patch" )

# requires running kde environment
RESTRICT+=" test"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package kdesu KF5Su)
		$(cmake-utils_use_find_package X Qt5X11Extras)
	)

	kde5_src_configure
}

src_install() {
	kde5_src_install
	use kdesu && dosym ../$(get_libdir)/libexec/kf5/kdesu /usr/bin/kdesu
}
