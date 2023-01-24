# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_HANDBOOK="forceoptional"
KDE_TEST="forceoptional"
FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.15.1
inherit kde5

DESCRIPTION="Scientific data analysis and visualisation based on KDE Frameworks"
HOMEPAGE="https://labplot.kde.org/ https://apps.kde.org/en/labplot2"
SRC_URI="mirror://kde/stable/${PN}/${PV}/${P}.tar.xz"

LICENSE="GPL-2"
SLOT="5"
KEYWORDS="*"
IUSE="cantor fftw fits hdf5 libcerf netcdf root serial telemetry"

# not packaged: dev-qt/qtmqtt, bug 683994
BDEPEND="
	sys-devel/bison
	sys-devel/gettext
"
DEPEND="
	$(add_qt_dep qtconcurrent)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtprintsupport)
	$(add_qt_dep qtsql)
	$(add_qt_dep qtsvg)
	$(add_qt_dep qtwidgets)
	$(add_frameworks_dep karchive)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep knewstuff)
	$(add_frameworks_dep kcrash)
	$(add_frameworks_dep ktextwidgets)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kxmlgui)
	$(add_frameworks_dep syntax-highlighting)
	>=sci-libs/gsl-1.15:=
	cantor? (
		$(add_kdeapps_dep cantor)
		$(add_frameworks_dep kparts)
		$(add_frameworks_dep kservice)
	)
	fftw? ( sci-libs/fftw:3.0= )
	fits? ( sci-libs/cfitsio:= )
	hdf5? ( sci-libs/hdf5:= )
	libcerf? ( sci-libs/libcerf )
	netcdf? ( sci-libs/netcdf:= )
	root? (
		app-arch/lz4
		sys-libs/zlib
	)
	serial? ( $(add_qt_dep qtserialport) )
	telemetry? ( dev-libs/kuserfeedback:5 )
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DENABLE_CANTOR=$(usex cantor)
		-DENABLE_FFTW=$(usex fftw)
		-DENABLE_FITS=$(usex fits)
		-DENABLE_HDF5=$(usex hdf5)
		-DENABLE_LIBCERF=$(usex libcerf)
		-DENABLE_NETCDF=$(usex netcdf)
		-DENABLE_ROOT=$(usex root)
		-DENABLE_QTSERIALPORT=$(usex serial)
		$(cmake-utils_use_find_package telemetry KUserFeedback)
		-DENABLE_TESTS=$(usex test)
		-DENABLE_MQTT=OFF
	)

	kde5_src_configure
}
