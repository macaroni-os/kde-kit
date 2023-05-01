# Distributed under the terms of the GNU General Public License v2

EAPI=7

CHECKREQS_DISK_BUILD="4G"
KDE_HANDBOOK="forceoptional"
KDE_TEST="forceoptional"
FRAMEWORKS_MINIMAL=5.98.0
QT_MINIMAL=5.15.1
inherit check-reqs kde5

DESCRIPTION="KDE Office Suite"
HOMEPAGE="https://calligra.org/"
SRC_URI="mirror://kde/stable/${PN}/${PV}/${P}.tar.xz"

CAL_FTS=( karbon sheets stage words )

LICENSE="GPL-2"
SLOT="5"
KEYWORDS="*"
IUSE="activities +charts +crypt +fontconfig gemini gsl +import-filter +lcms okular openexr
	+pdf phonon spacenav +truetype X $(printf 'calligra_features_%s ' ${CAL_FTS[@]})"

# TODO: Not packaged: Cauchy (https://bitbucket.org/cyrille/cauchy)
# Required for the matlab/octave formula tool
BDEPEND="
	sys-devel/gettext
"
COMMON_DEPEND="
	dev-lang/perl
	$(add_qt_dep designer)
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtdeclarative)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtprintsupport)
	$(add_qt_dep qtscript)
	$(add_qt_dep qtsvg)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtxml)
	$(add_frameworks_dep karchive)
	$(add_frameworks_dep kcmutils)
	$(add_frameworks_dep kcodecs)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdelibs4support)
	$(add_frameworks_dep kemoticons)
	$(add_frameworks_dep kglobalaccel)
	$(add_frameworks_dep kguiaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep kitemmodels)
	$(add_frameworks_dep kitemviews)
	$(add_frameworks_dep kjobwidgets)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep knotifyconfig)
	$(add_frameworks_dep kparts)
	$(add_frameworks_dep kross)
	$(add_frameworks_dep ktextwidgets)
	$(add_frameworks_dep kwallet)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kwindowsystem)
	$(add_frameworks_dep kxmlgui)
	$(add_frameworks_dep sonnet)
	sys-libs/zlib
	virtual/libiconv
	activities? ( $(add_frameworks_dep kactivities) )
	charts? ( dev-libs/kdiagram:5 )
	crypt? ( >=app-crypt/qca-2.3.0:2 )
	fontconfig? ( media-libs/fontconfig )
	gemini? ( $(add_qt_dep qtdeclarative widgets) )
	gsl? ( sci-libs/gsl )
	import-filter? (
		app-text/libetonyek
		app-text/libodfgen
		app-text/libwpd:*
		app-text/libwpg:*
		>=app-text/libwps-0.4
		dev-libs/librevenge
		media-libs/libvisio
	)
	lcms? (
		media-libs/ilmbase:=
		media-libs/lcms:2
	)
	okular? ( $(add_kdeapps_dep okular) )
	openexr? ( media-libs/openexr )
	pdf? ( app-text/poppler:=[qt5] )
	phonon? ( >=media-libs/phonon-4.11.0 )
	spacenav? ( dev-libs/libspnav )
	truetype? ( media-libs/freetype:2 )
	X? (
		$(add_qt_dep qtx11extras)
		x11-libs/libX11
	)
	calligra_features_sheets? ( dev-cpp/eigen:3 )
	calligra_features_words? ( dev-libs/libxslt )
"
DEPEND="${COMMON_DEPEND}
	dev-libs/boost
	test? ( $(add_frameworks_dep threadweaver) )
"
RDEPEND="${COMMON_DEPEND}
	calligra_features_karbon? ( media-gfx/pstoedit[plotutils] )
	gemini? (
		$(add_qt_dep qtquickcontrols2)
		$(add_frameworks_dep kirigami)
	)
"

RESTRICT+=" test"

PATCHES=( "${FILESDIR}"/${PN}-3.1.89-no-arch-detection.patch )

pkg_pretend() {
	check-reqs_pkg_pretend
}

pkg_setup() {
	kde5_pkg_setup
	check-reqs_pkg_setup
}

src_prepare() {
	kde5_src_prepare

	# Unconditionally disable deprecated deps (required by QtQuick1)
	punt_bogus_dep Qt5 Declarative
	punt_bogus_dep Qt5 OpenGL
}

src_configure() {
	local cal_ft myproducts

	# applications
	for cal_ft in ${CAL_FTS[@]}; do
		use calligra_features_${cal_ft} && myproducts+=( "${cal_ft^^}" )
	done

	use lcms && myproducts+=( PLUGIN_COLORENGINES )
	use okular && myproducts+=( OKULAR )
	use spacenav && myproducts+=( PLUGIN_SPACENAVIGATOR )

	local mycmakeargs=(
		-DPACKAGERS_BUILD=OFF
		-DRELEASE_BUILD=ON
		-DWITH_Iconv=ON
		-DCMAKE_DISABLE_FIND_PACKAGE_KF5CalendarCore=ON
		-DCMAKE_DISABLE_FIND_PACKAGE_KF5KHtml=ON
		-DPRODUCTSET="${myproducts[*]}"
		$(cmake-utils_use_find_package activities KF5Activities)
		$(cmake-utils_use_find_package charts KChart)
		-DWITH_Qca-qt5=$(usex crypt)
		-DWITH_Fontconfig=$(usex fontconfig)
		$(cmake-utils_use_find_package gemini Libgit2)
		$(cmake-utils_use_find_package gemini Qt5QuickWidgets)
		-DWITH_GSL=$(usex gsl)
		-DWITH_LibEtonyek=$(usex import-filter)
		-DWITH_LibOdfGen=$(usex import-filter)
		-DWITH_LibRevenge=$(usex import-filter)
		-DWITH_LibVisio=$(usex import-filter)
		-DWITH_LibWpd=$(usex import-filter)
		-DWITH_LibWpg=$(usex import-filter)
		-DWITH_LibWps=$(usex import-filter)
		$(cmake-utils_use_find_package phonon Phonon4Qt5)
		-DWITH_LCMS2=$(usex lcms)
		-DWITH_Okular5=$(usex okular)
		-DWITH_OpenEXR=$(usex openexr)
		-DWITH_Poppler=$(usex pdf)
		-DWITH_Eigen3=$(usex calligra_features_sheets)
		-DBUILD_UNMAINTAINED=$(usex calligra_features_stage)
		-ENABLE_CSTESTER_TESTING=$(usex test)
		-DWITH_Freetype=$(usex truetype)
	)

	kde5_src_configure
}
