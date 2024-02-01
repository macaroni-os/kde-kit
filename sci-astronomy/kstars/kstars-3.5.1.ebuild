# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.15.1
inherit eutils kde5

DESCRIPTION="Desktop Planetarium"
HOMEPAGE="https://apps.kde.org/en/kstars https://edu.kde.org/kstars/"
SRC_URI="mirror://kde/stable/${PN}/${P}.tar.xz"

LICENSE="GPL-2+ GPL-3+"
SLOT="5"
KEYWORDS="*"
IUSE="fits indi +password raw wcs"

REQUIRED_USE="indi? ( fits ) ${PYTHON_REQUIRED_USE}"

COMMON_DEPEND="
	$(add_qt_dep qtdatavis3d)
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtprintsupport)
	$(add_qt_dep qtsql)
	$(add_qt_dep qtsvg)
	$(add_qt_dep qtwebsockets)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep kauth)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kcrash)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep knewstuff)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep knotifyconfig)
	$(add_frameworks_dep kplotting)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kxmlgui)
	sys-libs/zlib
	fits? ( sci-libs/cfitsio:= )
	indi? (
		sci-libs/gsl:=
		>=sci-libs/indilib-1.7.5
		sci-libs/libnova:=
		sci-libs/stellarsolver
	)
	password? ( dev-libs/qtkeychain:= )
	raw? ( media-libs/libraw:= )
	wcs? ( sci-astronomy/wcslib:= )
"
# TODO: Add back when re-enabled by upstream
# 	opengl? (
# 		$(add_qt_dep qtopengl)
# 		virtual/opengl
# 	)
DEPEND="${COMMON_DEPEND}
	dev-cpp/eigen:3
	$(add_qt_dep qtconcurrent)
"
RDEPEND="${COMMON_DEPEND}
	$(add_qt_dep qtgraphicaleffects)
	$(add_qt_dep qtpositioning)
	$(add_qt_dep qtquickcontrols)
	$(add_qt_dep qtquickcontrols2)
"

src_configure() {
	local mycmakeargs=(
		-DFETCH_TRANSLATIONS=OFF
		-DBUILD_DOC=$(usex handbook)
		$(cmake-utils_use_find_package fits CFitsio)
		$(cmake-utils_use_find_package indi INDI)
		$(cmake-utils_use_find_package indi Nova)
		$(cmake-utils_use_find_package password Qt5Keychain)
		$(cmake-utils_use_find_package raw LibRaw)
		$(cmake-utils_use_find_package wcs WCSLIB)
	)

	kde5_src_configure
}

pkg_postinst() {
	if [[ -z "${REPLACING_VERSIONS}" ]]; then
		elog "Optional dependencies:"
		optfeature "Display 'current' pictures of planets" x11-misc/xplanet
	fi
	kde5_pkg_postinst
}
