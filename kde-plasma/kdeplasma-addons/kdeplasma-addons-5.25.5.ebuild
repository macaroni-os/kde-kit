# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.15.2
VIRTUALX_REQUIRED="test"
inherit eutils kde5

DESCRIPTION="Extra Plasma applets and engines"
LICENSE="GPL-2 LGPL-2"
SLOT="5"
KEYWORDS="*"
IUSE="comic share webengine"

RESTRICT+=" test" # bug 727846

DEPEND="
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep karchive)
	$(add_frameworks_dep kcmutils)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdeclarative)
	$(add_frameworks_dep kholidays)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep knewstuff)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep kpackage)
	$(add_frameworks_dep krunner)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep kunitconversion)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kxmlgui)
	$(add_frameworks_dep plasma)
	$(add_frameworks_dep sonnet)
	comic? ( $(add_frameworks_dep kross) )
	share? ( $(add_frameworks_dep purpose) )
	webengine? ( $(add_qt_dep qtwebengine) )
"
RDEPEND="${DEPEND}
	$(add_qt_dep qtquickcontrols)
	$(add_qt_dep qtquickcontrols2)
	$(add_plasma_dep plasma-workspace)
"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package comic KF5Kross)
		$(cmake-utils_use_find_package share KF5Purpose)
		$(cmake-utils_use_find_package webengine Qt5WebEngine)
	)

	kde5_src_configure
}

pkg_postinst() {
	if [[ -z "${REPLACING_VERSIONS}" ]]; then
		elog "Optional dependencies:"
		optfeature "Disk quota applet" sys-fs/quota
	fi
	kde5_pkg_postinst
}