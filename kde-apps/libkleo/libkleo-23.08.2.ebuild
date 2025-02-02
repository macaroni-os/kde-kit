# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_TEST="false"
FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="Library for encryption handling"
LICENSE="GPL-2+"
SLOT="5"
KEYWORDS="*"
IUSE="+fancyviewer"

RDEPEND="
	>=app-crypt/gpgme-1.16.0[cxx,qt5]
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kcodecs)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kitemmodels)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kwindowsystem)
	fancyviewer? ( $(add_kdeapps_dep kpimtextedit) )
"
DEPEND="${RDEPEND}
	dev-libs/boost
"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package fancyviewer KF5PimTextEdit)
	)

	kde5_src_configure
}
